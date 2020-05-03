//
//  ProfileViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 27/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var scrollVew: UIScrollView!
    @IBOutlet weak var carCollection: UICollectionView!
    
    var userId: String?
    var user: UserDTO?
    var cars: [CarDTO] = []
    let carManager = CarManager()
    let userManager = UserManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carCollection.register(UINib(nibName: "CarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarCell")
        carCollection.delegate = self
        carCollection.dataSource = self
        userProfileImage.layer.cornerRadius = userProfileImage.frame.height / 2
        
        userManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userManager.getUser(withId: userId ?? "")
    }
}

extension ProfileViewController: UserManagerDelegate {
    func userFetched(_ user: UserDTO) {
        self.user = user
        self.cars = user.cars
        
        DispatchQueue.main.async {
            self.carCollection.reloadData()
            self.userName.text = "\(user.profile.firstName) \(user.profile.lastName)"
            self.userProfileImage.setImage(from: user.profile.profileImages[0].link)
            self.userDescription.text = user.profile.description
        }
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "SearchToCarDetails", sender: self)
    }
    
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCollectionViewCell
        let car = cars[indexPath.row]
        carManager.prepare(cell: cell, using: car)
        return cell
    }
}
