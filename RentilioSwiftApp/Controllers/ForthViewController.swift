//
//  ForthViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    @IBOutlet weak var tripSegment: UISegmentedControl!
    @IBOutlet weak var tripTable: UITableView!
    
    var recentTrips = ["Trip"]
    var historyTrips = ["Trip"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tripSegment.removeAllSegments()
            tripSegment.insertSegment(withTitle: "Aktualne", at: 0, animated: false)
            tripSegment.insertSegment(withTitle: "Historia", at: 1, animated: false)
            tripSegment.selectedSegmentIndex = 0
            tripSegment.addTarget(self, action: #selector(self.segmentChanged), for: .valueChanged)
            
            tripTable.register(UINib(nibName: "ReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "ReservationCell")
            tripTable.delegate = self
            tripTable.dataSource = self
    }
        // must be internal or public.
        @objc func segmentChanged() {
            DispatchQueue.main.async {
                self.tripTable.reloadData()
                self.tripTable.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }

}

extension ForthViewController: UITableViewDelegate {
    
}

extension ForthViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tripSegment.selectedSegmentIndex == 0 {
            return recentTrips.count
        }
        return historyTrips.count
    }
    
    fileprivate func prepareCell(_ cell: ReservationTableViewCell, carName: String, dates: String, pickupPlace: String, thumbnail: UIImage) {
        cell.carName.text = carName
        cell.dates.text = dates
        cell.pickupPlace.text = pickupPlace
        cell.thumbnail.image = thumbnail
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath) as! ReservationTableViewCell
        if tripSegment.selectedSegmentIndex == 0 {
            prepareCell(cell, carName: "Bugatti Divo", dates: "20.04.20 - 23.04.20", pickupPlace: "zwrot: Galeria Mokotów, 12:00", thumbnail: #imageLiteral(resourceName: "first"))
        } else {
            prepareCell(cell, carName: "Bugatti Divo", dates: "20.04.20 - 23.04.20", pickupPlace: "zwrot: Galeria Mokotów, 12:00", thumbnail: #imageLiteral(resourceName: "second"))
        }
        return cell
    }
    
    
}
