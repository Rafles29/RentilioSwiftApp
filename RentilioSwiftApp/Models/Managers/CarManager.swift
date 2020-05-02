//
//  CarManager.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 02/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

protocol CarManagerDelegate {
    func carsFetched(_ cars: [CarDTO])
}

class CarManager {
    private var httpService: CarHttpService
    var delegate: CarManagerDelegate?
    
    init() {
        httpService = CarHttpService()
        httpService.delegate = self
    }
    
    func getCars() {
        httpService.getCars()
    }
}

extension CarManager: CarHttpDelegate {
    func carsFetched(cars: [CarDTO]) {
        self.delegate?.carsFetched(cars)
    }

}
