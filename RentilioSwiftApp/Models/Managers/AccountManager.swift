//
//  AccountManager.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 01/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation
import Alamofire

protocol AccountManagerDelegate {
    func userLoggedIn()
    func userRegistered()
    func tokenRefreshError()
    func error(_ error: AFError)
}

class AccountManager {
    
    static private var authenticationToken: AuthenticationTokenDTO?
    private var httpService: AccountHTTPService
    var delegate: AccountManagerDelegate?
    
    init() {
        self.httpService = AccountHTTPService()
        self.httpService.delegate = self
    }
    
    static var token: String? {
        guard isAccessTokenFresh else {
            return nil
        }
        return AccountManager.self.authenticationToken!.accessToken.value
    }
    
    static var userId: String? {
        guard isAccessTokenFresh else {
            return nil
        }
        return AccountManager.self.authenticationToken!.userId
    }
    
    func login(with loginData: LoginDTO) {
        httpService.login(loginData: loginData)
    }
    
    func register(newUser: RegisterDTO) {
        httpService.register(user: newUser)
    }
    
    func refreshToken() {
        guard isRefreshTokenFresh else {
            self.delegate?.tokenRefreshError()
            return
        }
        httpService.refreshToken(AccountManager.self.authenticationToken!.refreshToken.value)
    }
    
    private static func isTokenFresh(_ token: String) ->  Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        guard let validationDate = dateFormatter.date(from: token) else { return false }
        let now = Date()
        print(now > validationDate)
        return now > validationDate
    }
    
    private static var isAccessTokenFresh: Bool {
        guard let token = AccountManager.self.authenticationToken else {
            return false
        }
        return AccountManager.isTokenFresh(token.accessToken.expiration)
    }
    
    private var isRefreshTokenFresh: Bool {
        guard let token = AccountManager.self.authenticationToken else {
            return false
        }
        return AccountManager.isTokenFresh(token.refreshToken.expiration)
    }
}

extension AccountManager: AccountHTTPDelegate {
    func tokenRefreshed(token: AuthenticationTokenDTO) {
        AccountManager.authenticationToken = token
        delegate?.userLoggedIn()
    }
    
    func logedIn(token: AuthenticationTokenDTO) {
        AccountManager.authenticationToken = token
        delegate?.userLoggedIn()
    }
    
    func registered(user: UserDTO) {
        delegate?.userRegistered()
    }
    
    func error(_ error: AFError) {
        self.delegate?.error(error)
    }
    
}
