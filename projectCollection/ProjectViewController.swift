//
//  ProjectViewController.swift
//  projectCollection
//
//  Created by William Hettinger on 2/27/18.
//  Copyright © 2018 William Hettinger. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
       
    }

    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        projectImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //coredata context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let project = Project(context: context)
        project.title = titleTextField.text
        project.image = UIImagePNGRepresentation(projectImageView.image!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
