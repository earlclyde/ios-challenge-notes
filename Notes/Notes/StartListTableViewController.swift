//
//  StartListTableViewController.swift
//  Notes
//
//  Created by Mason Earl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit 

class StartListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    
}

// MARK: table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StartController.sharedController.entries.count
}

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toStartCell", forIndexPath: indexPath)
        
        let start = StartController.sharedController.entries[indexPath.row]
        
        
        cell.textLabel?.text = start.title
        
        return cell
}

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let start = StartController.sharedController.entries[indexPath.row]
            
            StartController.sharedController.removeStart(start)
            
            //: Delete row from table view
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
}

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toShowStart" {
        
            if let detailViewController = segue.destinationViewController as? StartDetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                
                let start = StartController.sharedController.entries[selectedIndex]
                detailViewController.entry = entry 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}





