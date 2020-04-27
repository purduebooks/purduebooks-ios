//
//  RegisterViewController.swift
//  Login-Designs
//
//  Created by Vishisht  Jain on 4/5/20.
//  Copyright © 2020 Gerald Brigen. All rights reserved.
//

import UIKit
import Parse
import SPAlert

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameField: FormTextField!
    @IBOutlet weak var passwordField: FormTextField!
    @IBOutlet weak var confirmPasswordField: FormTextField!
    
    @IBOutlet weak var emailField: FormTextField!
    
    @IBOutlet weak var pNField: FormTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onRegister(_ sender: Any) {
        let pN = Int(pNField.text!) ?? -1
        if(passwordField.text!.count >= 8 &&
           confirmPasswordField.text == passwordField.text &&
           pN > 0) {
            
            let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            user.email = emailField.text
            user["phone"] = pNField.text
        
            user.signUpInBackground { (success, error) in
                if success {
                    SPAlert.present(title: "Sign up successful, please log in.", preset: .done)
                    self.dismiss(animated: true, completion:nil)
                } else {
                    SPAlert.present(title: error?.localizedDescription ?? "Error", preset: .error)
                    print("Error: \(error?.localizedDescription)")
                }
            }
        }
            
        else if (passwordField.text!.count < 8) {
            print("Invalid password length. Make sure it is more than 8 characters!")
            SPAlert.present(title: "Invalid password length. Make sure it is more than 8 characters!", preset: .error)
        }
        else if (confirmPasswordField.text != passwordField.text) {
            SPAlert.present(title: "The passwords do not match!", preset: .error)
            print("The passwords do not match!")
        }
        else if (pN <= 0) {
            SPAlert.present(title: "Invalid phone number!!!", preset: .error)
            print("Invalid phone number!!!")
        }
    }
    
    
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
}
