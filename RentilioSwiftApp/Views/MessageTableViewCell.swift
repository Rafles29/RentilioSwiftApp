//
//  MessageTableViewCell.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 25/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
