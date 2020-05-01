//
//  ProfileImageDTO.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 30/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import Foundation

class ProfileImageDTO: ImageDTO {
    var profileId: Int
    
    init(imageId: String, link: String, name: String, profileId: Int) {
        self.profileId = profileId
        super.init(imageId: imageId, link: link, name: name)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
