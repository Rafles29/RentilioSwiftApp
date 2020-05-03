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
    
    func calculateRating(forCar car: CarDTO) -> Double {
        var sum = 0
        for review in car.reviews {
            sum += review.value
        }
        return Double(sum) / Double(car.reviews.count)
    }
    
    func getCars() {
        httpService.getCars()
    }
    
    func getCars(carName: String) {
        httpService.getCars(carName: carName)
    }
}

extension CarManager: CarHttpDelegate {
    func carsFetched(cars: [CarDTO]) {
        self.delegate?.carsFetched(cars)
    }

}
