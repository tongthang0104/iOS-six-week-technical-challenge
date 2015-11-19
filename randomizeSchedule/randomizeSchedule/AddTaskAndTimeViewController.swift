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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateTask(task: Task)  {
        self.task = task
        taskNameTextField.text = task.title
        
    }
    
    @IBAction func addButtonTapped(sender: UIButton) {
        
        if taskNameTextField.text != "" && taskNameTextField.text?.characters.count > 5 {
            let newTask = Task(title: taskNameTextField.text!)
            TaskController.shareController.addTask(newTask)
            self.task = newTask
        }else {
            let alert = UIAlertController(title: "Task is not valid", message: "Please add one longer than 5 characters", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .Default, handler: nil))
            
            presentViewController(alert, animated: true, completion: nil)
        }
        tableView.reloadData()
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem) {
        TaskController.shareController.removeAll()
        
    }
    
    // MARK: -UITableViewDataSource
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
