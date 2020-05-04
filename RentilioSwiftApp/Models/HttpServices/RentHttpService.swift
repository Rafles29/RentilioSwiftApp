//
//  RentHttpService.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation
import Alamofire

protocol RentHttpDelegate {
    func rentsFetched(_ rents: [RentDTO])
}

struct RentHttpService {
    
    var delegate: RentHttpDelegate?
    
    func getRents(authorizationToken: String) {
        let headers = HTTPHeaders.init([
            "Authorization": "Bearer \(authorizationToken)"
        ])
        AF.request(K.API.base + K.API.Rent.base, method: .get, headers: headers).responseDecodable(of: [RentDTO].self) { response in
            guard let data = response.value else { return }
            self.delegate?.rentsFetched(data)
        }
    }
}
