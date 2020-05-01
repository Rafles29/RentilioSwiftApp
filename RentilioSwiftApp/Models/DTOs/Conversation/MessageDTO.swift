//
//  MessageDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct MessageDTO: Codable {
    var messageId: String
    var dateTime: Date
    var content: String
    var read: Bool
    var sender: String
    var receiver: String
}
