//
//  ProfileImageDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

class ProfileImageDTO: ImageDTO {
    
    init(imageId: String, link: String, name: String, profileId: Int) {
        self.profileId = profileId
        super.init(imageId: imageId, link: link, name: name)
    }
    
    required init(from decoder: Decoder) throws {
        self.profileId = 0
        try! super.init(from: decoder)
    }
    var profileId: Int
}
