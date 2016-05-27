//
//  NotesListTableViewController.swift
//  Notes
//
//  Created by Mason Earl on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {

    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData() }
    
    override func viewDidLoad() {
        super.viewDidLoad() }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesController.sharedInstance.notes.count }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryNote", forIndexPath: indexPath)
        let note = NotesController.sharedInstance.notes[indexPath.row]
            cell.textLabel?.text = note.title
        return cell }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
           let note = NotesController.sharedInstance.notes[indexPath.row]
            NotesController.sharedInstance.removeNote(note)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade) }}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toShowNote" {
            if let notesDetailViewController = segue.destinationViewController as? NotesDetailViewController {
                if let noteCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(noteCell) {
                        let note = NotesController.sharedInstance.notes[indexPath.row]
                        notesDetailViewController.note = note }}}}}}