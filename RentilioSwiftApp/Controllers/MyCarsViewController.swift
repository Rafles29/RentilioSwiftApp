//
//  MyCarsViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 28/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class MyCarsViewController: UIViewController {

    @IBOutlet weak var carCollection: UICollectionView!
    
    var cars: [CarDTO] = []
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
        super.viewWillAppear(animated)
        
        carManager.getCars()
    }

}

extension MyCarsViewController: CarManagerDelegate {
    func carsFetched(_ cars: [CarDTO]) {
        self.cars = cars
        DispatchQueue.main.async {
            self.carCollection.reloadData()
        }
    }
}

extension MyCarsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SearchToCarDetails", sender: self)
    }
    
}


extension MyCarsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCollectionViewCell
        let car = cars[indexPath.row]
        carManager.prepare(cell: cell, using: car)
        return cell
    }
}
