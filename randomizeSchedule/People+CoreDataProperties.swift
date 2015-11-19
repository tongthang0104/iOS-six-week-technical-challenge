//
//  People+CoreDataProperties.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/18/15.
//  Copyright © 2015 Thang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension People {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var toTask: Task?

}
