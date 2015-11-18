//
//  AddTaskAndTimeViewController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//


import UIKit

class AddTaskAndTimeViewController: UIViewController {
    
    var task: Task?
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateTask(task: Task)  {
        self.task = task
        taskNameTextField.text = task.name
        timeTextField.text = task.timeToDo
    }
    @IBAction func addButtonTapped(sender: UIButton) {
        if let task = self.task {
            task.name = self.taskNameTextField.text!
            task.timeToDo = self.timeTextField.text!
        } else {
            let newTask = Task(name: self.taskNameTextField.text!, timeToDo: self.timeTextField.text!)
            TaskController.shareController.addTask(newTask)
            self.task = newTask
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func clearButtonTapped(sender: UIBarButtonItem) {
        taskNameTextField.text = ""
        timeTextField.text = ""
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
