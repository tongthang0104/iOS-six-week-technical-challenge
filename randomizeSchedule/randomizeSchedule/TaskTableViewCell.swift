//
//  TaskTableViewCell.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //MARK: Properties
    var task: Task?
    var people: People?
    
    @IBOutlet weak var taskPair: UILabel!
    
    @IBOutlet weak var userPair: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: randomParing
    func randomPairing(task: Task?, people: People?) {
        
        if let people = people?.firstName {
            userPair.text = people
        }
        if let taskTitle = task?.title{
            
            taskPair.text = taskTitle
            
        } else {
            
            userPair.text = "To be determine"
            taskPair.text = "To be determine"
        }
    }
    
    //    func updateWithTask(task: Task) {
    //        self.task = task
    //        taskNameLabel.text = task.name
    //        timeLabel.text = task.time
    //    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
