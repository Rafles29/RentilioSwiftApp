//
//  RegisterDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

struct RegisterDTO: Codable, DictionaryConvertor {
    var userName: String
    var password: String
    var email: String
    var firstName: String
    var lastName: String
}
/*
 

 {
   "userName": "string",
   "password": "string",
   "email": "string",
   "firstName": "string",
   "lastName": "string"
 }
 */
