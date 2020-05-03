//
//  UserManager.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 03/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

protocol UserManagerDelegate {
    func userFetched(_ user: UserDTO)
}

extension UserManagerDelegate {
    func userFetched(_ user: UserDTO) {
        print(user)
    }
}

class UserManager {
    var delegate: UserManagerDelegate?
    var httpService: UserHttpService
    
    init() {
        self.httpService = UserHttpService()
        self.httpService.delegate = self
    }
    
    func getUser(withId userId: String) {
        self.httpService.getUser(withId: userId)
    }
    
}

extension UserManager: UserHttpDelegate {
    func userFetched(_ user: UserDTO) {
        self.delegate?.userFetched(user)
    }
}
