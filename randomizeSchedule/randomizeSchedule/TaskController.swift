//
//  TaskController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation
import CoreData


class TaskController {
    
    static let shareController = TaskController()

    var taskRandomize:  [(Task, Task?)] = []
    
    var taskArray: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.executeFetchRequest(request) as! [Task]
        }catch {
            return []
        }
    }

    //Add Task
    func addTask(task: Task) {
        saveToPersistentStorage()
        
    }
    
    //Remove Task
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
        }
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving in \(error)")
        }
        
    }
}