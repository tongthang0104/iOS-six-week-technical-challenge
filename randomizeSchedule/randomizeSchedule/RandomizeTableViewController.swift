//
//  RandomizeTableViewController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class RandomizeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: Properties
    
    var task: Task?
    var randomTask : [(Task, Task?)] = []
    
    @IBOutlet weak var tableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    //MARK: Action
    @IBAction func randomizeButtonTapped(sender: UIButton) {
        randomTask = TaskController.shareController.randomizeTask()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return randomTask.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskTableViewCell
        
        let tasks = self.randomTask[indexPath.row]
        cell.randomPairing(tasks.0, timeMatch: tasks.1)
    
        return cell
    }


 





    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "updateTask" {
            if let updateTaskDestination = segue.destinationViewController as? AddTaskAndTimeViewController {
                let _ = updateTaskDestination.view
                
                if let selectedRows = tableView.indexPathForSelectedRow?.row {
                    let tasks = TaskController.shareController.taskArray[selectedRows]
                    updateTaskDestination.updateTask(tasks)
                }
            }
        }
        
        
    }
    

}
