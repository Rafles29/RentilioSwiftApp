//
//  LoginDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

struct LoginDTO: Codable, DictionaryConvertor {
    var userName: String
    var password: String
}
/*
 {
   "userName": "string",
   "password": "string"
 }
 */
