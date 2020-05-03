//
//  Constants.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 01/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct K {
    struct API {
        static let base = "http://localhost:5000/api/"
        struct Authenticate {
            static let login = "Account/authenticate"
            static let register = "Account/register"
            static let refeshToken = "Account/tokens/"
        }
        struct Car {
            static let base = "Cars/"
        }
        struct User {
            static let base = "Users/"
        }
    }
}
