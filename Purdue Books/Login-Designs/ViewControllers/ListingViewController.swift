//
//  ListingViewController.swift
//  Login-Designs
//
//  Created by Monal on 4/5/20.
//  Copyright © 2020 Gerald Brigen. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse
import DropDown
import SPAlert

class ListingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descriptionOfTextbook: UITextField!
    @IBOutlet weak var courseNumberButton: UIButton!
    @IBOutlet weak var courseTitleButton: UIButton!
    @IBOutlet weak var titleTextbook: UITextField!
    @IBOutlet weak var picture: UIImageView!
    
    var titles = [String]()
    var numbers = [String]()
    var titles_read = [PFObject]()
    var numbers_read = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTitleData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        let listingTB = PFObject(className: "Textbooks")
        listingTB["Author"] = PFUser.current()!
        listingTB["Name"] = titleTextbook.text
        listingTB["Description"] = descriptionOfTextbook.text
        listingTB["CouseNumber"] = courseNumberButton.currentTitle
        listingTB["Course"] = courseTitleButton.currentTitle
        let imageData = picture.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData! )
        listingTB["image"] = file
        listingTB.saveInBackground { (success, error) in
            if success {
                SPAlert.present(title: "Sucessfully listed book!", preset: .done);
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload_books"), object: nil);
                self.dismiss(animated: true, completion:nil)
            } else {
                SPAlert.present(title: "Error, please try again", preset: .error);
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onClear(_ sender: Any) {
        courseNumberButton.setTitle("Choose Course Number", for: .normal)
        titleTextbook.text = nil
        picture = nil
        courseTitleButton.setTitle("Choose Course Title", for: .normal)
        descriptionOfTextbook.text = nil
    }
    @objc func loadTitleData() {
        titles.removeAll()
        let query = PFQuery(className: "Courses");
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
           if let error = error {
              print(error.localizedDescription)
           } else if let posts = posts {
              print("Successfully retrieved \(posts.count) posts.")
            self.titles_read = posts
           }
        }
        for post in titles_read {
            titles.append((post["Name"] as? String)!)
        }
        loadNumberData()
    }
    @objc func loadNumberData() {
        numbers.removeAll()
        let query = PFQuery(className: "Numbers");
        query.order(byAscending: "Number")
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
           if let error = error {
              print(error.localizedDescription)
           } else if let posts = posts {
              print("Successfully retrieved \(posts.count) posts.")
            self.numbers_read = posts
           }
        }
        for post in numbers_read {
            let number_string = post["Number"] as? String
            let name_string = post["Name"] as? String
            if (name_string == courseTitleButton.currentTitle) {
                numbers.append(number_string!)
            }
        }
    }
    @objc func loadTitle() {
//        print("Executes")
        let dropDown = DropDown()
        dropDown.anchorView = courseTitleButton
        dropDown.dataSource = titles
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.courseTitleButton.setTitle(item, for: .normal)
            self?.loadTitleData()
        }
        dropDown.dismissMode = .automatic
        dropDown.width = 150
        dropDown.direction = .bottom
//        print("Executes Also")
        dropDown.show()
    }
    @objc func loadNumber() {
        let dropDown = DropDown()
        dropDown.anchorView = courseNumberButton
        dropDown.dataSource = numbers
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.courseNumberButton.setTitle(item, for: .normal)
            self?.loadNumberData()
        }
        dropDown.dismissMode = .automatic
        dropDown.width = 100
        dropDown.direction = .bottom
        dropDown.show()
    }
    @IBAction func onClickCourseTitle(_ sender: Any) {
        loadTitleData()
        loadTitle()
    }
    @IBAction func onClickCourseNumber(_ sender: Any) {
        loadNumberData()
        loadNumber()
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        
        let scaledImage = image.af_imageScaled(to: size)
        picture.image = scaledImage
        
        dismiss(animated: true, completion: nil)
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
