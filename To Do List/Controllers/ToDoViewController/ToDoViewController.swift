//
//  ToDoViewController.swift
//  To Do List
//
//  Created by Denis Bystruev on 07/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    // MARK: - ... @IBOutlet
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: - ... Stored Properties
    var todo: ToDo?
    
    var isPickerHidden = true {
        didSet {
            if oldValue != isPickerHidden {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
    }
    
    // MARK: - ... UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dueDatePicker.date = Date().addingTimeInterval(24 * 60 * 60)
        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
    }
    
    // MARK: - ... Custom Methods
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    // MARK: - ... @IBAction
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    @IBAction func isCompleteButtonPressed(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
        isPickerHidden = true
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
        isPickerHidden = true
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func textEditingFinished(_ sender: UIDatePicker) {
        isPickerHidden = true
    }
}
