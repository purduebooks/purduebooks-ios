//
//  AllBooksViewController.swift
//  Purdue Books
//
//  Created by Monal on 4/12/20.
//  Copyright © 2020 Purdue Books. All rights reserved.
//

import UIKit
import Parse
import DropDown

class AllBooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleNumberButton: UIButton!
    @IBOutlet weak var courseNumberButton: UIButton!
    
    var books = [PFObject]()
    var titles = [String]()
    var numbers = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllBooksTableViewCell") as! AllBooksTableViewCell
        cell.courseNumber.text = books[indexPath.row]["CouseNumber"] as? String
        cell.courseName.text = books[indexPath.row]["Name"] as? String
        let tempTitle = books[indexPath.row]["Course"] as! String
        if (!titles.contains(tempTitle)) {
            if (titles.count == 0) {
                titles.append("All Titles")
            }
            titles.append(tempTitle)
        }
        let tempNumber = books[indexPath.row]["CouseNumber"] as! String
        if (!numbers.contains(tempNumber)) {
            if (numbers.count == 0) {
                numbers.append("All Numbers")
            }
            numbers.append(tempNumber)
        }
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
    
    @objc func loadTitle() {
        let dropDown = DropDown()
        dropDown.anchorView = titleNumberButton
        dropDown.dataSource = titles
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.titleNumberButton.setTitle(item, for: .normal)
        }
        dropDown.dismissMode = .automatic
        dropDown.width = 150
        dropDown.direction = .bottom
        dropDown.show()
    }
    
    @objc func loadNumber() {
        let dropDown = DropDown()
        dropDown.anchorView = courseNumberButton
        dropDown.dataSource = numbers
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.courseNumberButton.setTitle(item, for: .normal)
        }
        dropDown.dismissMode = .automatic
        dropDown.width = 100
        dropDown.direction = .bottom
        dropDown.show()
    }
    
    @IBAction func chooseTitle(_ sender: Any) {
        loadTitle()
        loadData()
        self.tableView.reloadData()
    }
    
    @IBAction func chooseNumber(_ sender: Any) {
        loadNumber()
        loadData()
        self.tableView.reloadData()
    }
    
    @objc func loadData() {
        let query = PFQuery(className: "Textbooks");
        
        if (titleNumberButton.currentTitle == "All Titles") {
            query.whereKey("Author", notEqualTo: PFUser.current() as Any)
        }
        else {
            query.whereKey("Author", notEqualTo: PFUser.current() as Any)
            query.whereKey("Course", equalTo: titleNumberButton.currentTitle as Any)
        }
        
        if (courseNumberButton.currentTitle != "All Numbers") {
            query.whereKey("CouseNumber", equalTo: courseNumberButton.currentTitle as Any)
        }
        print("Works")
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
        DropDown.startListeningToKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: NSNotification.Name(rawValue: "reload_books"), object: nil)
    }

}
