//
//  RentDetailsViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 26/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class RentDetailsViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var carName: UILabel!
    
    
    var rentId: Int?
    var rentManager = RentManager()
    var userManager = UserManager()
    var rent: RentDTO?
    var carOwner: UserDTO?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rentManager.delegate = self
        userManager.delegate = self
    }
    
    @IBAction func goToProfileButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "RentToProfile", sender: self)
    }
    
    @IBAction func goToCarButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "RentToCar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RentToProfile" {
            let vc = segue.destination as! ProfileViewController
            vc.userId = carOwner?.userId
        } else if segue.identifier == "RentToCar" {
            let vc = segue.destination as! CarDetailsViewController
            vc.carId = rent?.car?.carId
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let id = rentId else {
            return
        }
        rentManager.getRent(withId: id)
    }
    
    func setView() {
        self.userName.text = "\(carOwner!.profile.firstName) \(carOwner!.profile.lastName)"
        self.userProfileImage.setImage(from: carOwner!.profile.profileImages[0].link)
        self.totalPrice.text = String(rent!.price)
        self.carName.text = "\(rent!.car!.manufactor) \(rent!.car!.model)"
        self.carImage.setImage(from: rent!.car!.carImages[0].link)
        let startDate = Date(from: rent!.startDate, using: K.DateFormat.format)
        let endDate = Date(from: rent!.endDate, using: K.DateFormat.format)
        self.startDate.text = "\(startDate.getDate()). \(startDate.getTime())"
        self.endDate.text = "\(endDate.getDate()). \(endDate.getTime())"
        self.adress.text = rent!.adress
    }
}

extension RentDetailsViewController: UserManagerDelegate {
    func userFetched(_ user: UserDTO) {
        self.carOwner = user
        DispatchQueue.main.async {
            self.setView()
        }
    }
}

extension RentDetailsViewController: RentManagerDelegate {
    func rentFetched(_ rent: RentDTO) {
        self.rent = rent
        userManager.getUser(withId: rent.car!.userId)
    }
}
