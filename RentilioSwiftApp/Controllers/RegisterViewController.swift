//
//  RegisterViewController.swift
//  RentilioSwiftApp
//
//  Created by Rafal Wozniak on 27/04/2020.
//  Copyright © 2020 Rafal Wozniak. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    let accountManager = AccountManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        accountManager.delegate = self
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let regiserData: RegisterDTO = RegisterDTO(userName: loginTextField.text!, password: passwordTextField.text!, email: emailTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
        
        accountManager.register(newUser: regiserData)
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

extension RegisterViewController: AccountManagerDelegate {
    func userLoggedIn() {
        return
    }
    
    func userRegistered() {
        print("User registered")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tokenRefreshError() {
        return
    }
    
    func error(_ error: AFError) {
        print(error)
    }
    
    
}
