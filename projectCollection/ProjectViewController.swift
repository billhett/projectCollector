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
    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var project : Project? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if project != nil {
            print("we have a game!")
            projectImageView.image = UIImage(data: project!.image!)
            titleTextField.text = project?.title
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            print("we have no game")
            deleteButton.isHidden = true
        }
        
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
        if project != nil {
            print("we have a game!")
            project!.title = titleTextField.text
            project!.image = UIImagePNGRepresentation(projectImageView.image!)
            
        } else {
            print("we have no game")
            //coredata context
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let project = Project(context: context)
            project.title = titleTextField.text
            project.image = UIImagePNGRepresentation(projectImageView.image!)
        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
