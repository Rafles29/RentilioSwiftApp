//
//  SearchCarsViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class SearchCarsViewController: UIViewController {

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
        searchBar.delegate = self
        carManager.getCars()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchCars()
    }

}

extension SearchCarsViewController: CarManagerDelegate {
    func carsFetched(_ cars: [CarDTO]) {
        print(cars)
        self.cars = cars
        DispatchQueue.main.async {
            self.carCollection.reloadData()
        }
    }
}

extension SearchCarsViewController: UISearchBarDelegate {
    
    func searchCars() {
        if searchBar.text == nil || searchBar.text == "" {
            carManager.getCars()
        } else {
            let carName = searchBar.text
            carManager.getCars(carName: carName!)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchCars()
        searchBar.endEditing(true)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchCars()
        searchBar.endEditing(true)
    }
}

extension SearchCarsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SearchToCarDetails", sender: self)
    }
    
}


extension SearchCarsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath) as! CarCollectionViewCell
        let car = cars[indexPath.row]
        let carRating = carManager.calculateRating(forCar: car)
        cell.carName.text = "\(car.manufactor) \(car.model)"
        cell.carType.text = car.type.toString()
        if carRating.isNaN {
            cell.rating.text = "\(0) ⭐️"
        } else {
            cell.rating.text = "\(carRating) ⭐️"
        }
        cell.reviews.text =  "\(car.reviews.count) recenzji"
        cell.image.setImage(from: car.carImages[0].link)
        if carRating < 4 ||  carRating.isNaN{
            cell.bestHost.isHidden = true
        }
        return cell
    }
}
