//
//  ForthViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class RentsViewController: UIViewController {

    @IBOutlet weak var rentSegment: UISegmentedControl!
    @IBOutlet weak var rentsTable: UITableView!
    
    var recentRents = [RentDTO]()
    var pastRents = [RentDTO]()
    let rentManager = RentManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            rentSegment.removeAllSegments()
            rentSegment.insertSegment(withTitle: "Aktualne", at: 0, animated: false)
            rentSegment.insertSegment(withTitle: "Historia", at: 1, animated: false)
            rentSegment.selectedSegmentIndex = 0
            rentSegment.addTarget(self, action: #selector(self.segmentChanged), for: .valueChanged)
            
            rentsTable.register(UINib(nibName: "ReservationTableViewCell", bundle: nil), forCellReuseIdentifier: "ReservationCell")
            rentsTable.delegate = self
            rentsTable.dataSource = self
        
            rentManager.delegate = self
            rentManager.getRents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.setNavigationBarHidden(true, animated: false)
        rentManager.getRents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController!.setNavigationBarHidden(false, animated: false)
    }

    // must be internal or public.
    @objc func segmentChanged() {
        DispatchQueue.main.async {
            //self.rentsTable.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            self.rentsTable.reloadData()
        }
    }
}

extension RentsViewController: RentManagerDelegate {
    func rentsFetched(_ rents: [RentDTO]) {
        print(rents)
        let (currentRents, pastRents) = rentManager.divideRents(rents)
        self.recentRents = currentRents
        self.pastRents = pastRents
        DispatchQueue.main.async {
            self.rentsTable.reloadData()
        }
    }
}

extension RentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ToTripDetails", sender: self)
    }
}

extension RentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rentSegment.selectedSegmentIndex == 0 {
            return recentRents.count
        }
        return pastRents.count
    }
    
    fileprivate func prepareCell(_ cell: ReservationTableViewCell, rent: RentDTO) {
        cell.carName.text = "Bugatti Divo"
        let startDate = Date(from: rent.startDate, using: K.DateFormat.format).getDate()
        let endDate = Date(from: rent.endDate, using: K.DateFormat.format)
        cell.dates.text = "\(startDate) - \(endDate.getDate())"
        cell.pickupPlace.text = "zwrot: \(rent.adress), \(endDate.getTime())"
        cell.thumbnail.image = #imageLiteral(resourceName: "second")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationCell", for: indexPath) as! ReservationTableViewCell
        let rent: RentDTO
        if rentSegment.selectedSegmentIndex == 0 {
            rent = self.recentRents[indexPath.row]
        } else {
            rent = self.pastRents[indexPath.row]
        }
        prepareCell(cell, rent: rent)
        return cell
    }
    
    
}
