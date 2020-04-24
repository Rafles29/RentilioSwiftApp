//
//  FifthViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 24/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
    
    let sections = ["Konto", "Flota"]
    let menu = [
        ["Profil", "Zaloguj się", "Zarejestruj się", "Wyloguj się"],
        ["Moje samochody", "Dodaj samochód"]
    ]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FifthViewController: UITableViewDelegate {
    
}

extension FifthViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menu[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicMenuCell", for: indexPath)
        cell.textLabel?.text = menu[indexPath.section][indexPath.row]
        return cell
    }
    
    
}
