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
        let user = PFUser.current()
        nameField.text = "HOHOHO"
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

}
