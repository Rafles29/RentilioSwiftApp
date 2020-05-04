//
//  RentManager.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

protocol RentManagerDelegate {
    func rentsFetched(_ rents: [RentDTO])
    func rentFetched(_ rent: RentDTO)
}

extension RentManagerDelegate {
    func rentsFetched(_ rents: [RentDTO]) {
        print(rents)
    }
    func rentFetched(_ rent: RentDTO) {
        print(rent)
    }
}

class RentManager {
    
    var delegate: RentManagerDelegate?
    var httpService: RentHttpService
    
    init() {
        httpService = RentHttpService()
        httpService.delegate = self
    }
    
    func getRents() {
        guard let token = AccountManager.token else { return }
        httpService.getRents(authorizationToken: token)
    }
    
    func getRent(withId rentId: Int) {
        guard let token = AccountManager.token else { return }
        httpService.getRent(authorizationToken: token, rentId: rentId)
    }
    
    func divideRents(_ rents: [RentDTO]) -> ([RentDTO], [RentDTO]) {
        let now = Date()
        var currentRents = [RentDTO]()
        var pastRents = [RentDTO]()
        for rent in rents {
            let date = Date(from: rent.endDate, using: K.DateFormat.format)
            if now < date {
                currentRents.append(rent)
            } else {
                pastRents.append(rent)
            }
        }
        return (currentRents, pastRents)
    }
}

extension RentManager: RentHttpDelegate {
    
    func rentsFetched(_ rents: [RentDTO]) {
        self.delegate?.rentsFetched(rents)
    }
    
    func rentFetched(_ rent: RentDTO) {
        self.delegate?.rentFetched(rent)
    }
}
