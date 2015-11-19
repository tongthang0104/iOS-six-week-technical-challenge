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

    @IBOutlet weak var taskPair: UILabel!
    @IBOutlet weak var timePair: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: randomParing
    func randomPairing(taskMatch: Task, timeMatch: Task?) {
        
       taskPair.text = taskMatch.name
        
        if let timeMatch = timeMatch?.time{
            
            timePair.text = timeMatch
            
        } else {
            
            timePair.text = "To be determine"
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
