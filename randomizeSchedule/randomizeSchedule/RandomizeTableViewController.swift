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
    var randomTask : [(Task?, People?)] = []
    
    
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
        if TaskController.shareController.taskArray.count > PeopleController.shareController.peopleArray.count {
            let alert = UIAlertController(title: "Too much tasks", message: "Not enough people to complete", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Delete last Task", style: .Default, handler: { (action) -> Void in
                if let lastTask = TaskController.shareController.taskArray.last{
                    TaskController.shareController.remove(lastTask)
                }
            })
        )
            presentViewController(alert, animated: true, completion: nil)
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return randomTask.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! TaskTableViewCell
        
        let tasks = self.randomTask[indexPath.row]
        
        cell.randomPairing(tasks.0, people: tasks.1)
        
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
    
    
  
    }
    
    

