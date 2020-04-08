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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        toDoTextField?.text = ""
        print("Add button pressed")
    }


}

