//
//  ToDoTableViewController.swift
//  To Do List
//
//  Created by Denis Bystruev on 07/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    // MARK: - ... Stored Properties
    var todos = [ToDo]()

    // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = ToDo.loadToDos()
    }
    
    // MARK: - ... Navigation
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveSegue" else { return }
    }
}
