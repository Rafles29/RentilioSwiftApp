//
//  AdressDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct AdressDTO: Codable {
    var adressId: Int
    var city: String
    var postCode: String
    var street: String
}
