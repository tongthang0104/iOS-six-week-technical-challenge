//
//  UserListTableViewController.swift
//  randomizeSchedule
//
//  Created by Thang H Tong on 11/19/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Please add your Users", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let add = UIAlertAction(title: "Add User", style: .Default) { (action) -> Void in
            
            if let textFields = alert.textFields,
                
                let firstName = textFields[0].text,
                
                let lastName = textFields[1].text {
                    
                    let people = People(firstName: firstName, lastName: lastName)
                    
                    PeopleController.shareController.addPeople(people)
                    self.tableView.reloadData()
            }
        }
        alert.addAction(cancel)
        
        alert.addAction(add)
        
        alert.addTextFieldWithConfigurationHandler { (firstNameField) -> Void in
            
            firstNameField.placeholder = "FirstName"
            
        }
        
        alert.addTextFieldWithConfigurationHandler { (lastNameField) -> Void in
            
            lastNameField.placeholder = "LastName"
            
        }
    
        presentViewController(alert, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PeopleController.shareController.peopleArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("peopleListCell", forIndexPath: indexPath) as! UsersTableViewCell
        
        let people = PeopleController.shareController.peopleArray[indexPath.row]
        cell.updateWithUser(people)
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
