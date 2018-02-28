//
//  ViewController.swift
//  projectCollection
//
//  Created by William Hettinger on 2/27/18.
//  Copyright © 2018 William Hettinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var projects : [Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        projects = try context.fetch(Project.fetchRequest())
            print("\n\nprojects = \(projects)")
        } catch {
            print("error fetching: \(error)")
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let project = projects[indexPath.row]
        
        cell.textLabel?.text = project.title
        cell.imageView?.image = UIImage(data: project.image!)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

