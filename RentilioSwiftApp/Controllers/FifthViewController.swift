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
        [Link(name: "Profil", identifier: "MenuToProfile"), Link(name: "Zarejestruj się", identifier: "MenuToRegister"), Link(name: "Zaloguj Się", identifier: "MenuToLogin"), Link(name: "Wyloguj się", identifier: "")],
        [Link(name: "Moje samochody", identifier: "MenuToMyCars"), Link(name: "Dodaj samochód", identifier: "")]
    ]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuToProfile" {
            let vc = segue.destination as! ProfileViewController
            let userId = AccountManager.userId
            vc.userId = userId
        }
    }
}

extension FifthViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: menu[indexPath.section][indexPath.row].identifier, sender: self)
    }
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
        cell.textLabel?.text = menu[indexPath.section][indexPath.row].name
        return cell
    }
    
    
}

struct Link {
    var name: String
    var identifier: String
}
