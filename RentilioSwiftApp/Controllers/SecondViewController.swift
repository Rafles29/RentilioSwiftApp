//
//  SecondViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carCollection: UICollectionView!
    
    var cars:[CarDTO] = []
    let carManager = CarManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carCollection.register(UINib(nibName: "CarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarCell")
        carCollection.delegate = self
        carCollection.dataSource = self
        carManager.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        carManager.getCars()
    }

}

extension SecondViewController: CarManagerDelegate {
    func carsFetched(_ cars: [CarDTO]) {
        print(cars)
        self.cars = cars
        DispatchQueue.main.async {
            self.carCollection.reloadData()
        }
    }
}

extension SecondViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SearchToCarDetails", sender: self)
    }
    
}


extension SecondViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCollectionViewCell
        cell.carName.text = "\(cars[indexPath.row].manufactor) \(cars[indexPath.row].model)"
        return cell
    }
}
