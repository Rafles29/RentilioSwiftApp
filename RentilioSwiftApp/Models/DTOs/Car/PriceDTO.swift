//
//  PriceDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct PriceDTO: Codable {
    var priceId: Int
    var carId: Int
    var daily: Double
    var weekend: Double
    var week: Double
    var twoWeeks: Double
    var month: Double
    var currency: Currency
}

enum Currency: Codable {
    init(from decoder: Decoder) throws {
        fatalError()
    }
    
    func encode(to encoder: Encoder) throws {
        fatalError()
    }
    
    case PLN
}
