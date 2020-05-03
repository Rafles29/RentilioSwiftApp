//
//  UserHttpService.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 03/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation
import Alamofire

protocol UserHttpDelegate {
    func userFetched(_ user: UserDTO)
}

struct UserHttpService {
    
    var delegate: UserHttpDelegate?
    
    func getUser(withId userId: String) {
        let url = K.API.base + K.API.User.base + userId
        AF.request(url, method: .get).responseDecodable(of: UserDTO.self) { response in
            print(response)
            guard let data = response.value else { return }
            self.delegate?.userFetched(data)
        }
    }
}
