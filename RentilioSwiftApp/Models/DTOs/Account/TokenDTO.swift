//
//  TokenDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct AuthenticationTokenDTO: Codable {
    var accessToken: TokenDTO
    var refreshToken: TokenDTO
    var userId: String
}

struct TokenDTO: Codable {
    var value: String
    var expiration: String
}
/*
 {
   "accessToken": {
     "value": "string",
     "expiration": "2020-04-30T09:41:14.895Z"
   },
   "refreshToken": {
     "value": "string",
     "expiration": "2020-04-30T09:41:14.895Z"
   },
   "userId": "string"
 }
 */
