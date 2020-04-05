//
//  ListingViewController.swift
//  Login-Designs
//
//  Created by Monal on 4/5/20.
//  Copyright © 2020 Gerald Brigen. All rights reserved.
//

import UIKit
import AlamofireImage

class ListingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descriptionOfTextbook: UITextField!
    @IBOutlet weak var courseNumber: UITextField!
    @IBOutlet weak var titleTextbook: UITextField!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var course: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
    }
    
    @IBAction func onClear(_ sender: Any) {
        courseNumber.text = nil
        titleTextbook.text = nil
        picture = nil
        course.text = nil
        descriptionOfTextbook.text = nil
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
