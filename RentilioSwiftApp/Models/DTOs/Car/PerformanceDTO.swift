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

enum Gearbox: Int, Codable {
    case AUTOMATIC, MANUAL
    func toString() -> String {
        switch self {
        case .AUTOMATIC:
            return "Automat"
        case .MANUAL:
            return "Manual"
        default:
            return ""
        }
    }
}
enum Fuel: Int, Codable {
    case EV, HYBRID, DIESEL, PETROL
    
    func toString() -> String {
        switch self {
        case .EV:
            return "Elektryk"
        case .HYBRID:
            return "Hybrid"
        case .DIESEL:
            return "Diesel"
        case .PETROL:
            return "Benzyna"
        default:
            return ""
        }
    }
}
