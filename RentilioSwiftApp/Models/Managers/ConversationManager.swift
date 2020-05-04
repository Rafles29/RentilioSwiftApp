//
//  ConversationManager.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

protocol ConversationManagerDelegate {
    func conversationsFetched(_ conversations: [ConversationDTO])
}

class ConversationManager {
    
    var delegate: ConversationManagerDelegate?
    var httpService: ConversationHttpService
    
    init() {
        httpService = ConversationHttpService()
        httpService.delegate = self
    }
    
    func getConversations() {
        guard let token = AccountManager.token else { return }
        httpService.getConversations(authorizationToken: token)
    }
}

extension ConversationManager: ConversationHttpDelegate {
    func conversationsFetched(_ conversations: [ConversationDTO]) {
        self.delegate?.conversationsFetched(conversations)
    }
}
