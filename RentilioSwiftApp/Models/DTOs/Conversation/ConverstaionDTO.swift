//
//  ConverstaionDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct ConversationDTO: Codable {
    var conversationId: String
    var me: UserDTO
    var otherGuy: UserDTO
    var read: Bool?
    var lastMessage: MessageDTO?
}

/*
 {
   "conversationId": "string",
   "me": User
   "otherGuy": User
   "read": true,
   "lastMessage": {
     "messageId": "string",
     "dateTime": "2020-04-30T13:48:59.781Z",
     "content": "string",
     "read": true,
     "sender": "string",
     "receiver": "string"
   }
 }
 */
