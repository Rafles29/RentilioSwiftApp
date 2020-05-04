//
//  NotificationManager.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

protocol NotificationManagerDelegate {
    func notificationsFetched(_ notifications: [NotificationDTO])
}

class NotificationManager {
    
    var delegate: NotificationManagerDelegate?
    var httpService: NotificationHttpService
    
    init() {
        httpService = NotificationHttpService()
        httpService.delegate = self
    }
    
    func getNotifications() {
        guard let token = AccountManager.token else { return }
        httpService.getNotifications(authorizationToken: token)
    }
}

extension NotificationManager: NotificationHttpDelegate {
    
    func notificationsFetched(_ notifications: [NotificationDTO]) {
        self.delegate?.notificationsFetched(notifications)
    }
}
