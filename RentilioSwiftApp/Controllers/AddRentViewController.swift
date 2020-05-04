//
//  AddRentViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 28/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class AddRentViewController: UIViewController {

    @IBOutlet weak var startDateTextField: UITextField!
    var carId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.startDateTextField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    

    @objc func tapDone() {
        if let datePicker = self.startDateTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            self.startDateTextField.text = dateformatter.string(from: datePicker.date)
        }
        self.startDateTextField.resignFirstResponder()
    }

}
