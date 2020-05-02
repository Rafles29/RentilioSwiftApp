//
//  RentDto.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct RentDTO: Codable {
    var rentId: Int
    var confirmed: Bool
    var startDate: String
    var endDate: String
    var price: Double
    var adress: String
    var userId: String
    var carId: Int
}
