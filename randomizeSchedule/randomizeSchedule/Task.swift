//
//  Task.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

class Task: Equatable {
    var name: String
    var timeToDo: String
    
    init(name: String, timeToDo: String) {
        self.name = name
        self.timeToDo = timeToDo
    }
}

func ==(lhs: Task, rhs: Task) -> Bool {
    return (lhs.name == rhs.name) && (lhs.timeToDo == rhs.timeToDo)
}
