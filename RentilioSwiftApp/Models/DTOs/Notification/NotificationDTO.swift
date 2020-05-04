//
//  NotificationDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct NotificationDTO: Codable {
    var notificationId: String
    var dateTime: String
    var content: String
    var type: String?
    var value: String?
    var userId: String
}

/*
 {
   "notificationId": "string",
   "dateTime": "2020-04-30T12:58:53.052Z",
   "content": "string",
   "type": "string",
   "value": "string",
   "userId": "string"
 }
 */
