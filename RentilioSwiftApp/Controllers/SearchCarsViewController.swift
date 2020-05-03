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
    var pickedCarId: Int?
    
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
        super.viewWillAppear(animated)
        
        self.navigationController!.setNavigationBarHidden(true, animated: false)
        searchCars()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController!.setNavigationBarHidden(false, animated: false)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchToCarDetails" {
            let vc = segue.destination as! CarDetailsViewController
            vc.carId = pickedCarId
        }
    }

}

extension SearchCarsViewController: CarManagerDelegate {
    func carsFetched(_ cars: [CarDTO]) {
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
        pickedCarId = cars[indexPath.row].carId
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
        carManager.prepare(cell: cell, using: car)
        return cell
    }
}
