//
//  CarImageDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

class CarImageDTO: ImageDTO{
    init(imageId: String, link: String, name: String, carId: Int) {
        self.carId = carId
        super.init(imageId: imageId, link: link, name: name)
    }
    
    required init(from decoder: Decoder) throws {
        self.carId = 0
        try! super.init(from: decoder)
    }
    var carId: Int
}
