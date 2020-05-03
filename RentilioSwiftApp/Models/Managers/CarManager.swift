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
    func carFetched(_ car: CarDTO)
}

extension CarManagerDelegate {
    func carsFetched(_ cars: [CarDTO]) {
        print(cars)
    }
    
    func carFetched(_ car: CarDTO) {
        print(car)
    }
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
    
    func getCar(byId carId: Int) {
        httpService.getCar(byId: carId)
    }
    
    func getCars(carName: String) {
        httpService.getCars(carName: carName)
    }
    
    func prepare(cell: CarCollectionViewCell, using car: CarDTO) {
        let carRating = calculateRating(forCar: car)
        cell.carName.text = "\(car.manufactor) \(car.model)"
        cell.carType.text = car.type.toString()
        if carRating.isNaN {
            cell.rating.text = "\(0) ⭐️"
        } else {
            cell.rating.text = "\(carRating) ⭐️"
        }
        cell.reviews.text =  "\(car.reviews.count) recenzji"
        cell.image.setImage(from: car.carImages[0].link)
        if carRating < 4 ||  carRating.isNaN{
            cell.bestHost.isHidden = true
        }
    }
}

extension CarManager: CarHttpDelegate {
    func carFetched(car: CarDTO) {
        self.delegate?.carFetched(car)
    }
    
    func carsFetched(cars: [CarDTO]) {
        self.delegate?.carsFetched(cars)
    }

}
