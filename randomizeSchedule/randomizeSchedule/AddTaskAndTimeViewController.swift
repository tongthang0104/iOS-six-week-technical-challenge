//
//  AddTaskAndTimeViewController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//


import UIKit

class AddTaskAndTimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var task: Task?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateTask(task: Task)  {
        self.task = task
        taskNameTextField.text = task.name
        timeTextField.text = task.time
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        if let task = self.task {
            task.name = self.taskNameTextField.text!
            task.time = self.timeTextField.text!
        } else {
            let newTask = Task(name: self.taskNameTextField.text!, time: self.timeTextField.text!)
            TaskController.shareController.addTask(newTask)
            self.task = newTask
        }
        tableView.reloadData()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem) {
        taskNameTextField.text = ""
        timeTextField.text = ""
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shareController.taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tasksListCell", forIndexPath: indexPath) as! TasksListTableViewCell
        
        let tasks = TaskController.shareController.taskArray[indexPath.row]
        cell.updateWithTask(tasks)
        return cell
        
    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let tasks = TaskController.shareController.taskArray[indexPath.row]
            TaskController.shareController.remove(tasks)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
