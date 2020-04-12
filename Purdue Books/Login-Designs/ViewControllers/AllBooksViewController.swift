//
//  AllBooksViewController.swift
//  Purdue Books
//
//  Created by Monal on 4/12/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit
import Parse

class AllBooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var books = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllBooksTableViewCell") as! AllBooksTableViewCell
        cell.courseNumber.text = books[indexPath.row]["CouseNumber"] as? String
        cell.courseName.text = books[indexPath.row]["Name"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:ViewBookViewController = self.storyboard!.instantiateViewController(identifier: "ViewBookViewController")
        vc.bookData = books[indexPath.row];
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
        
    }
    
   @objc func loadData() {
        let query = PFQuery(className: "Textbooks");
        
        query.whereKey("Author", notEqualTo: PFUser.current() as Any)
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
           if let error = error {
              print(error.localizedDescription)
           } else if let posts = posts {
              print("Successfully retrieved \(posts.count) posts.")
            self.books = posts;
            self.tableView.reloadData()
           }
        }
    }
    
    override func viewDidLoad() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: NSNotification.Name(rawValue: "reload_books"), object: nil)
    }

}
