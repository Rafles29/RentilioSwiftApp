//
//  CarDetailsViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 27/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var gearbox: UILabel!
    @IBOutlet weak var horsePower: UILabel!
    @IBOutlet weak var seats: UILabel!
    @IBOutlet weak var fuel: UILabel!
    @IBOutlet weak var carDescription: UILabel!
    @IBOutlet weak var carOwnerImage: UIImageView!
    @IBOutlet weak var carOwnerName: UILabel!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    
    var carId: Int?
    var car: CarDTO?
    var owner: UserDTO?
    let carManager = CarManager()
    let userManager = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        carManager.delegate = self
        userManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carManager.getCar(byId: carId!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CarDetailsToRent" {
            let vc = segue.destination as! AddRentViewController
            vc.carId = self.carId
        }
    }
    
    @IBAction func rentButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "CarDetailsToRent", sender: self)
    }
    
}

extension CarDetailsViewController: UserManagerDelegate {
    func userFetched(_ user: UserDTO) {
        DispatchQueue.main.async {
            self.carOwnerName.text = "\(user.profile.firstName) \(user.profile.lastName)"
            self.carOwnerImage.setImage(from: user.profile.profileImages[0].link)
        }
    }
}

extension CarDetailsViewController: CarManagerDelegate {
    
    func carFetched(_ car: CarDTO) {
        self.car = car
        userManager.getUser(withId: car.userId)
        DispatchQueue.main.async {
            self.carDescription.text = car.description
            self.image.setImage(from: car.carImages[0].link)
            self.carType.text = car.type.toString()
            self.carName.text = "\(car.manufactor) \(car.model)"
                
            self.fuel.text = car.performance!.fuel.toString()
            self.seats.text = String(car.equipment!.seats)
            self.horsePower.text = String(car.performance!.horsePower)
            self.gearbox.text = car.performance!.gearBox.toString()
            
            //TODO: add car features
            }
        }

}
