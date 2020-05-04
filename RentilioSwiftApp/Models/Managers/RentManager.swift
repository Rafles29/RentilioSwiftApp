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
}
