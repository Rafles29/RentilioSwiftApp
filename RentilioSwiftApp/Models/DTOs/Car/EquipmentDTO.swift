//
//  EquipmentDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct EquipmentDTO: Codable {
    var equipmentId: Int
    var carId: Int
    var seats: Int
    var features: [CarFeatureDTO]
}
