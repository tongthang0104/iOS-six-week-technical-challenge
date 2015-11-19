//
//  TasksListTableViewCell.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class TasksListTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!

    var task: Task?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        self.taskNameLabel.text = task.title
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
