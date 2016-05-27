//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Mason Earl on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearButtonTapped(sender: AnyObject) {
        self.titleTextField.text = ""
        self.textView.text = ""
        
    }

    @IBAction func saveButtonTapped(sender: AnyObject) {
//        if let title = title {
//            guard let title = titleTextField.text, text = textView.text
        }
        
    
    }
