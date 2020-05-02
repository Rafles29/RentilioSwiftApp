//
//  CarDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct CarDTO: Codable {
    var carId: Int
    var userId: String
    var year: Int
    var manufactor: String
    var model: String
    var description: String
    
    var type: CarType
    var price: PriceDTO
    var performance: PerformanceDTO
    var carImages: [CarImageDTO]
    var rents: [RentDTO]
    
}

enum CarType: Int, Codable {
    case HATCHBACK, SEDAN, SUV, COUPE, CONVERTIBLE, MOTORCYCLE, VAN, TRUCK, OTHER
}

/*
 {
   "carId": 0,
   "year": 0,
   "manufactor": "string",
   "model": "string",
   "description": "string",
   "type": 0,
   "equipment": Equipment,
   "price": Price,
   "performance": Performance
   "carImages": [CarImages]
   "adresses": [Adress],
  
   "rents": Rent,
   "userId": "string"
 }
 */
