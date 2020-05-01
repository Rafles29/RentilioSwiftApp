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
    func carFetched(car: [CarDTO])
}

struct CarHttpService {
    
    var delegate: CarHttpDelegate
    
    func getCars() {
        AF.request(K.API.base + K.API.Car.base, method: .get).responseDecodable(of: [CarDTO].self) { response in
            guard let data = response.value else { return }
            print(data)
            self.delegate.carFetched(car: data)
        }
    }
}
