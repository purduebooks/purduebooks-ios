//
//  EditProfileViewController.swift
//  Purdue Books
//
//  Created by Vishisht  Jain on 4/19/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit
import Parse

class EditProfileViewController: UIViewController {

    @IBOutlet weak var usernameEditField: FormTextField!
    
    @IBOutlet weak var passwordEditField: FormTextField!
    
    @IBOutlet weak var emailEditField: FormTextField!
    
    @IBOutlet weak var phoneNoEditField: FormTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onFinalEdit(_ sender: Any) {
        let user:PFUser = PFUser.current()!
        
        var username_edited = false;
        var password_edited = false;
        var email_edited = false;
        var phone_no_edited = false;
        
        if(!usernameEditField.text!.isEmpty) {
            user["username"] = usernameEditField.text
            username_edited = true;
        }
        
        if(!emailEditField.text!.isEmpty) {
            user["email"] = emailEditField.text
            password_edited = true;
        }
        
        if(!phoneNoEditField.text!.isEmpty) {
            user["phone"] = phoneNoEditField.text
            email_edited = true;
        }
        
        if(!passwordEditField.text!.isEmpty) {
            user["password"] = passwordEditField.text
            phone_no_edited = true;
        }
        
        if(username_edited == true ||
        password_edited == true ||
        phone_no_edited == true ||
            email_edited == true) {
            user.saveInBackground();
            self.dismiss(animated: true, completion: nil);
        }
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
