//
//  ImageDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

class ImageDTO: Codable {
    init(imageId: String, link: String, name: String) {
        self.imageId = imageId
        self.link = link
        self.name = name
    }
    var imageId: String
    var link: String
    var name: String?
}
