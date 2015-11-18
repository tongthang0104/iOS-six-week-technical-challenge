//
//  TaskController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

class TaskController {
    
    static let shareController = TaskController()

    var taskArray: [Task] = []
    
    //Create mock Task
    var mockTask: [Task] {
        let task1 = Task(name: "Working on Capstone Project", timeToDo: "12:00 PM")
        let task2 = Task(name: "Take Shower", timeToDo: "8:00 PM")
        let task3 = Task(name: "Go to bed", timeToDo: "11:00 PM")
        
        return [task1, task2, task3]
    }
    
    init() {
        self.taskArray = mockTask
    }
    
    //Add Task
    func addTask(task: Task) {
        TaskController.shareController.taskArray.append(task)
        
    }
    
    //Remove Task
    func removeTask(task: Task) {
        
        if let index = taskArray.indexOf(task) {
            taskArray.removeAtIndex(index)
        } else {
            print("error")
        }
    }   
}