//
//  ThirdViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var inboxSegment: UISegmentedControl!
    @IBOutlet weak var inboxTableView: UITableView!
    var notifications = ["Powiadomienie", "Powiadomienie", "Powiadomienie", "Powiadomienie", "Powiadomienie", "Powiadomienie", "Powiadomienie", "Powiadomienie", "Powiadomienie"]
    var messages = ["Wiadomość","Wiadomość", "Wiadomość", "Wiadomość","Wiadomość", "Wiadomość", "Wiadomość","Wiadomość", "Wiadomość"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inboxSegment.removeAllSegments()
        inboxSegment.insertSegment(withTitle: "Powiadomienia", at: 0, animated: false)
        inboxSegment.insertSegment(withTitle: "Wiadomości", at: 1, animated: false)
        inboxSegment.selectedSegmentIndex = 0
        inboxSegment.addTarget(self, action: #selector(self.segmentChanged), for: .valueChanged)
        
        inboxTableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "MessageCell")
        inboxTableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        inboxTableView.delegate = self
        inboxTableView.dataSource = self
    }
    // must be internal or public.
    @objc func segmentChanged() {
        DispatchQueue.main.async {
            self.inboxTableView.reloadData()
            self.inboxTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension ThirdViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inboxSegment.selectedSegmentIndex == 0 {
            return notifications.count
        }
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if inboxSegment.selectedSegmentIndex == 0 {
            return prepareNotificationCell(tableView, indexPath)
        } else {
            return prepareMessageCell(tableView, indexPath)
        }
    }
    
    fileprivate func prepareMessageCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageTableViewCell
        cell.profileImage.image = #imageLiteral(resourceName: "first")
        cell.time.text = "21:37"
        cell.name.text = "Rafał Woźniak"
        cell.content.text = "Witam, piszę z zapytaniem o najnwosze lamborghini gallardo"
        return cell
    }
    
    fileprivate func prepareNotificationCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationTableViewCell
        cell.mainImage.image = #imageLiteral(resourceName: "second")
        cell.time.text = "21:37"
        cell.subject.text = "Nowa rezerwacja"
        cell.content.text = "Laura Roberts chce wypożyczyć Bugatti Divo"
        return cell
    }
}

extension ThirdViewController: UITableViewDelegate {
    
}
