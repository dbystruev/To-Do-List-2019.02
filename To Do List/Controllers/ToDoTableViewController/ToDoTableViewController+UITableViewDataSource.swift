//
//  ToDoTableViewController+UITableViewDataSource.swift
//  To Do List
//
//  Created by Denis Bystruev on 07/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

extension ToDoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") else {
            print("Error in \(#file.name) in \(#function) at line \(#line): can't dequeue ToDoCell")
            fatalError()
        }
        
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = "\(todo.dueDate)"
        
        return cell
    }
}
