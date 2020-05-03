//
//  LoginViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 27/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    let accountManager = AccountManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountManager.delegate = self
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let loginData = LoginDTO(userName: loginTextField.text!, password: passwordTextField.text!)
        
        accountManager.login(with: loginData)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: AccountManagerDelegate {
    func userLoggedIn() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func userRegistered() {
        return
    }
    
    func tokenRefreshError() {
        return
    }
    
    func error(_ error: AFError) {
        print(error)
    }
}
