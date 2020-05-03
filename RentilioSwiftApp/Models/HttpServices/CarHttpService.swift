//
//  CarHttpService.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 01/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation
import Alamofire

protocol CarHttpDelegate {
    func carsFetched(cars: [CarDTO])
    func carFetched(car: CarDTO)
}
struct CarHttpService {
    
    var delegate: CarHttpDelegate?
    
    func getCar(byId carId: Int) {
        AF.request(K.API.base + K.API.Car.base + String(carId), method: .get).responseDecodable(of: CarDTO.self) { response in
            guard let data = response.value else { return }
            self.delegate?.carFetched(car: data)
        }
    }
    
    func getCars() {
        AF.request(K.API.base + K.API.Car.base, method: .get).responseDecodable(of: [CarDTO].self) { response in
            guard let data = response.value else { return }
            self.delegate?.carsFetched(cars: data)
        }
    }
    
    func getCars(carName: String) {
        let parameters: [String: Any] = ["CarName": carName]
        AF.request(K.API.base + K.API.Car.base, method: .get, parameters: parameters).responseDecodable(of: [CarDTO].self) { response in
            guard let data = response.value else { return }
            self.delegate?.carsFetched(cars: data)
        }
    }
}
