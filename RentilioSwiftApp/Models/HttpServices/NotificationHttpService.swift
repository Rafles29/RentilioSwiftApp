//
//  NotificationHttpService.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

import Alamofire

protocol NotificationHttpDelegate {
    func notificationsFetched(_ notifications: [NotificationDTO])
}

struct NotificationHttpService {
    
    var delegate: NotificationHttpDelegate?
    
    func getNotifications(authorizationToken: String) {
        let headers = HTTPHeaders.init([
            "Authorization": "Bearer \(authorizationToken)"
        ])
        AF.request(K.API.base + K.API.Notification.base, method: .get, headers: headers).responseDecodable(of: [NotificationDTO].self) { response in
            print(response)
            guard let data = response.value else { return }
            self.delegate?.notificationsFetched(data)
        }
    }
}
