//
//  ReservationTableViewCell.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 26/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var dates: UILabel!
    @IBOutlet weak var pickupPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
