//
//  ViewController.swift
//  ToDoList
//
//  Created by Dinos Tsiounis on 8/4/20.
//  Copyright © 2020 Konstantinos Tsiounis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var toDoTextField: UITextField?
    
    let toDoList = ToDoList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView?.dataSource = toDoList
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        guard let todo = toDoTextField?.text else {
            return
        }
        
        toDoList.add(todo)
        toDoTextField?.text = ""
        tableView?.reloadData()
        
    }


}

