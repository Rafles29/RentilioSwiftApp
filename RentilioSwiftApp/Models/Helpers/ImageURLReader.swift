//
//  ImageURLReader.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 03/05/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(from imageURL: String) {
        let url = URL(string: imageURL)
        let session = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        session.resume()
    }
}
