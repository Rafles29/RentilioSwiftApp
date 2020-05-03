//
//  UserDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct UserDTO: Codable {
    var userId: String
    var cars: [CarDTO]
    var userName: String
    var profile: ProfileDTO
}

struct ProfileDTO: Codable {
    var firstName: String
    var lastName: String
    var description: String?
    var profileImages: [ProfileImageDTO]
    var userId: String
    
}
/*
 "otherGuy": {
 "userId": "string",
 "cars": [Car]
 "userName": "string",
 "profile": {
   "firstName": "string",
   "lastName": "string",
   "description": "string",
   "profileImages": [ProfileImage]
   "userId": "string"
 }
 */
