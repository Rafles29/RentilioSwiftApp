//
//  PerformanceDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct PerformanceDTO: Codable {
    var performanceId: Int
    var carId: Int
    var horsePower: Int
    var gearBox: Gearbox
    var fuel: Fuel
}

enum Gearbox: Codable {
    init(from decoder: Decoder) throws {
        fatalError()
    }
    
    func encode(to encoder: Encoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    case MANUAL
}
enum Fuel: Codable {
    init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func encode(to encoder: Encoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    case PETROL
}
