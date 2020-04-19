//
//  ProfileViewController.swift
//  Purdue Books
//
//  Created by Vishisht  Jain on 4/18/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var passwordField: UILabel!
    
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var pnField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: NSNotification.Name(rawValue: "reload_profile"), object: nil)
    }
    
    @objc func loadData() {
        let user:PFUser = PFUser.current()!
        nameField.text = user.username
        emailField.text = user.email
        pnField.text = user["phone"] as! String
    }

    
    @IBAction func editProfile(_ sender: Any) {
        self.performSegue(withIdentifier: "editSegue", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let user:PFUser = PFUser.current()!
        nameField.text = user.username
        emailField.text = user.email
        pnField.text = user["phone"] as! String
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
