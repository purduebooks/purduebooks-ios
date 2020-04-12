//
//  ViewBookViewController.swift
//  Purdue Books
//
//  Created by Vidur Gupta on 4/12/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ViewBookViewController: UIViewController {
    
    var bookData:PFObject = PFObject(className: "Textbooks", dictionary: nil);
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseNumber: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellerNumber: UILabel!
    @IBOutlet weak var sellerEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = bookData["Name"] as? String
        self.courseName.text = bookData["Course"] as? String
        self.courseNumber.text = bookData["CouseNumber"] as? String
        
        let author = bookData["Author"] as! PFUser
        author.fetchInBackground(block: { (object, error) in
            self.sellerName.text = author.username ?? "No username found"
            
        })
        
        let img = bookData["image"] as! PFFileObject
        print(img.url);
        self.imageView.af_setImage(withURL: URL(string: img.url ?? "")!)
        
        self.sellerNumber.text = "Private" // TODO: implement in DB
        self.sellerEmail.text = "Private"
    }
    
}
