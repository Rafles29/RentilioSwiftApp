//
//  ConversationHttpService.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 04/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation
import Alamofire

protocol ConversationHttpDelegate {
    func conversationsFetched(_ conversations: [ConversationDTO])
}

struct ConversationHttpService {
    
    var delegate: ConversationHttpDelegate?
    
    func getConversations(authorizationToken: String) {
        let headers = HTTPHeaders.init([
            "Authorization": "Bearer \(authorizationToken)"
        ])
        AF.request(K.API.base + K.API.Convesration.base, method: .get, headers: headers).responseDecodable(of: [ConversationDTO].self) { response in
            print(response)
            guard let data = response.value else { return }
            self.delegate?.conversationsFetched(data)
        }
    }
}
