//
//  StartDetailViewController.swift
//  Notes
//
//  Created by Mason Earl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit 

class StartDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let entry = entry {
            updateWithStart(entry)
        }
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
    
    if let start = self.entry {
        
        entry.title = self.titleTextField.text!
        entry.text = self.bodyTextView.text
        entry.textStorage = NSData()
    
    } else {
   
    let newStart = Entry(title: self.titleTextField.text!, text: self.bodyTextView.text)
    
    StartController.sharedController.addStart(newStart)
   
    self.entry = newEntry
    }
    
    self.navigationController?.popViewControllerAnimated(true)
}

    @IBAction func clearButtonTapped(sender: AnyObject) {

        titleTextField.text = ""
        bodyTextView.text = ""
}

    func updateWithStart(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.text
}
// MARK: UITextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
