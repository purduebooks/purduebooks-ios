//
//  ViewController.swift
//  Login-Designs
//
//  Created by Purdue Books on 4/18/19.
//  Copyright © 2019 Purdue Books. All rights reserved.
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
        var let_login = false;
        if (!usernameField.text!.isEmpty && !passwordField.text!.isEmpty) {
            PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
                 if user != nil {
                     self.performSegue(withIdentifier: "loginSegue", sender: nil)
                 } else {
                    print("Error: \(error?.localizedDescription)")
                    self.dismiss(animated: true, completion:nil)
                }
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    func shouldPerformSegue(withIdentifier: String!, sender: AnyObject!) -> Bool {
        if withIdentifier == "loginSegue" { // you define it in the storyboard (click on the segue, then Attributes' inspector > Identifier
            
            if (!usernameField.text!.isEmpty && !passwordField.text!.isEmpty) {
                return true;
            }
        }
        
        return false;
    }

}
