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
    
    var taskArray: [Task] {
        
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.executeFetchRequest(request) as! [Task]
        }catch {
            return []
        }
    }

    func randomizeTask() -> [(Task?, People?)] {
        var tasks = self.taskArray
        var people = PeopleController.shareController.peopleArray
        var taskPair = [(Task?, People?)]()
        while tasks.count > 1 {
            
            var randomInt = Int(arc4random_uniform(UInt32(tasks.count)))
            let task1 = tasks.removeAtIndex(randomInt)
            
            randomInt = Int(arc4random_uniform(UInt32(people.count)))
            let people = people.removeAtIndex(randomInt)
            
            taskPair.append((task1, people))
            saveToPersistentStorage()
        }
        
        if let firstTask = tasks.first {
            taskPair.append((firstTask, people.first))
            saveToPersistentStorage()
        }
        
        return taskPair
    }
    
    //Add Task
    func addTask(task: Task) {
        saveToPersistentStorage()
        
    }
    
    //Remove Task
    
    func remove(task: Task) {
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