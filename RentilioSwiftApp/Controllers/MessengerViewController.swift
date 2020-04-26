//
//  MessengerViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 26/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class MessengerViewController: UIViewController {

    @IBOutlet weak var messagesTable: UITableView!
    
    var messages = ["Test", "Test2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        messagesTable.delegate = self
        messagesTable.dataSource = self
        
        messagesTable.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessengerCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
extension MessengerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessengerCell", for: indexPath) as! MessageCell
        
        return cell
    }
}

extension MessengerViewController: UITableViewDelegate {
    
}
