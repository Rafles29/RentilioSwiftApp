//
//  ReviewDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 03/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

struct ReviewDTO: Codable {
    let reviewId: Int
    let content: String
    let value: Int
    let dateTime: String
    let user: UserDTO
}
/*
"reviews": [
  {
    "reviewId": 0,
    "content": "string",
    "value": 0,
    "dateTime": "2020-05-03T09:32:05.665Z",
    "user": {
      "firstName": "string",
      "lastName": "string",
      "description": "string",
      "profileImages": [
        {
          "imageId": "string",
          "link": "string",
          "name": "string",
          "profileId": 0
        }
      ],
      "userId": "string"
    }
  }
],
*/
