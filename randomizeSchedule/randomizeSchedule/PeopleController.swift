//
//  PeopleController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

//
//  TaskController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation
import CoreData


class PeopleController {
    
    static let shareController = PeopleController()
    
    var peopleArray: [People] {
        
        let request = NSFetchRequest(entityName: "People")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.executeFetchRequest(request) as! [People]
        }catch {
            return []
        }
    }
    
    //Add Task
    func addPeople(people: People) {
        saveToPersistentStorage()
        
    }
    
    //Remove Task
    
    func remove(people: People) {
        if let moc = people.managedObjectContext {
            moc.deleteObject(people)
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