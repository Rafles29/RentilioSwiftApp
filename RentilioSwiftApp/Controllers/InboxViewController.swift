//
//  InboxViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {

    @IBOutlet weak var inboxSegment: UISegmentedControl!
    @IBOutlet weak var inboxTableView: UITableView!
    var notifications: [NotificationDTO] = []
    var conversations: [ConversationDTO] = []
    let conversationManager = ConversationManager()
    let notificationManager = NotificationManager()
    
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
        
        conversationManager.delegate = self
        notificationManager.delegate = self
    }
    // must be internal or public.
    @objc func segmentChanged() {
        if inboxSegment.selectedSegmentIndex == 1 {
            conversationManager.getConversations()
        } else {
            notificationManager.getNotifications()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.setNavigationBarHidden(true, animated: false)
        
        segmentChanged()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController!.setNavigationBarHidden(false, animated: false)
    }
}

extension InboxViewController: NotificationManagerDelegate {
    func notificationsFetched(_ notifications: [NotificationDTO]) {
        self.notifications = notifications
        DispatchQueue.main.async {
            self.inboxTableView.reloadData()
            //self.inboxTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    
}

extension InboxViewController : ConversationManagerDelegate {
    func conversationsFetched(_ conversations: [ConversationDTO]) {
        self.conversations = conversations
        DispatchQueue.main.async {
            self.inboxTableView.reloadData()
            //self.inboxTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}

extension InboxViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if inboxSegment.selectedSegmentIndex == 0 {
            return notifications.count
        }
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if inboxSegment.selectedSegmentIndex == 0 {
            return prepareNotificationCell(tableView, indexPath)
        } else {
            return prepareConversationCell(tableView, indexPath)
        }
    }
    
    fileprivate func prepareConversationCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageTableViewCell
        let conversation = self.conversations[indexPath.row]
        cell.profileImage.setImage(from: conversation.otherGuy.profile.profileImages[0].link)
        if let dateTime = conversation.lastMessage?.dateTime {
            let date = Date(from: dateTime, using: K.DateFormat.format)
            cell.time.text = date.getTime()
        } else {
            cell.time.text = "00:00"
        }
        cell.name.text = "\(conversation.otherGuy.profile.firstName) \(conversation.otherGuy.profile.lastName)"
        cell.content.text = conversation.lastMessage?.content ?? "Brak wiadomości"
        return cell
    }
    
    fileprivate func prepareNotificationCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationTableViewCell
        let notification = self.notifications[indexPath.row]
        cell.mainImage.image = #imageLiteral(resourceName: "second")
        cell.subject.text = "Powiadomienie"
        cell.content.text = notification.content
        let date = Date(from: notification.dateTime, using: K.DateFormat.format)
        cell.time.text = date.getTime()
        return cell
    }
}

extension InboxViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if inboxSegment.selectedSegmentIndex == 1 {
            self.performSegue(withIdentifier: "InboxToMessenger", sender: self)
        }
    }
    
}
