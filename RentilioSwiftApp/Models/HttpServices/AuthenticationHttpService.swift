//
//  AuthenticationHttpService.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation
import Alamofire

protocol AccountHTTPDelegate {
    func tokenRefreshed(token: AuthenticationTokenDTO)
    func logedIn(token: AuthenticationTokenDTO)
    func registered(user: UserDTO)
    func error(_ error: AFError)
}

struct AccountHTTPService {
    
    var delegate: AccountHTTPDelegate?
    
    func refreshToken(_ token: String) {
        AF.request(K.API.base + K.API.Authenticate.login + token, method: .get, encoding: JSONEncoding.default).responseDecodable(of: AuthenticationTokenDTO.self) { response in
            guard let data = response.value else {
                self.delegate?.error(response.error!)
                return
            }
            self.delegate?.tokenRefreshed(token: data)
        }
    }
    
    func register(user: RegisterDTO) {
        let parameters = user.toDictionary()
        AF.request(K.API.base + K.API.Authenticate.register, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: UserDTO.self) { response in
            guard let data = response.value else {
                self.delegate?.error(response.error!)
                return
            }
            self.delegate?.registered(user: data)
        }
    }
    
    func login(loginData: LoginDTO) {
        let parameters = loginData.toDictionary()
        AF.request(K.API.base + K.API.Authenticate.login, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: AuthenticationTokenDTO.self) { response in
            guard let data = response.value else {
                self.delegate?.error(response.error!)
                return
            }
            self.delegate?.logedIn(token: data)
        }
    }
    
}

