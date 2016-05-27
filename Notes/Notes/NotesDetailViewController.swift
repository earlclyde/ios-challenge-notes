//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Mason Earl on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    var note: Note?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = note {
            updateWithNote(note) }}
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() }

    @IBAction func clearButtonTapped(sender: AnyObject) {
        self.titleTextField.text = ""
        self.textView.text = "" }

    @IBAction func saveButtonTapped(sender: AnyObject) {
       if let note = note {
        guard let title = titleTextField.text, text = textView.text else { return }
        note.title = title
        note.text = text
        self.textView.resignFirstResponder()
       } else {
        guard let title = titleTextField.text, text = textView.text else { return }
        let note = Note(title: title, text: text)
        NotesController.sharedInstance.addNote(note) }
        self.navigationController?.popViewControllerAnimated(true) }

    func updateWithNote(note: Note) {
        titleTextField.text = note.title
        textView.text = note.text }
        
        func textFieldShouldReturn(textView: UITextField) -> Bool {
            textView.resignFirstResponder()
            return true }}