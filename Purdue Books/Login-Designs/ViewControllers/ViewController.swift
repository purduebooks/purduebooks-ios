//
//  ViewController.swift
//  Login-Designs
//
//  Created by Gerald Brigen on 4/18/19.
//  Copyright © 2019 Gerald Brigen. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: FormTextField!
    @IBOutlet weak var passwordField: FormTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: Any) {
        
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
             if user != nil {
                 self.performSegue(withIdentifier: "loginSegue", sender: nil)
             } else {
                 print("Error: \(error?.localizedDescription)")
                
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
}
