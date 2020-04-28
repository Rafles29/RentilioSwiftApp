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
    
    var cars = ["car1", "car2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carCollection.register(UINib(nibName: "CarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarCell")
        carCollection.delegate = self
        carCollection.dataSource = self
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
        return cell
    }
}
