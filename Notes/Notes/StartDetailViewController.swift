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
    
    var start: Start?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let start = start {
            updateWithStart(start)
        }
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
    
    if let start = self.start {
        
        start.title = self.titleTextField.text!
        start.text = self.bodyTextView.text
        start.textStorage = NSData()
    
    } else {
   
    let newStart = Start(title: self.titleTextField.text!, text: self.bodyTextView.text)
    
    StartController.sharedController.addStart(newStart)
   
    self.start = newStart
    }
    
    self.navigationController?.popViewControllerAnimated(true)
}

    @IBAction func clearButtonTapped(sender: AnyObject) {

        titleTextField.text = ""
        bodyTextView.text = ""
}

    func updateWithStart(start: Start) {
        self.start = start
        
        self.titleTextField.text = start.title
        self.bodyTextView.text = start.text
}
// MARK: UITextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
