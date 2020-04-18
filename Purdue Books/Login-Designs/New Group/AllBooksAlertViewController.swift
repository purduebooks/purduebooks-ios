//
//  AllBooksAlertViewController.swift
//  Purdue Books
//
//  Created by Monal on 4/18/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit

class AllBooksAlertViewController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openFilter(_ sender: Any) {
        let alert = UIAlertController(title: "Filters", message: "Please select the filters below:", preferredStyle: .actionSheet);
        
        
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
