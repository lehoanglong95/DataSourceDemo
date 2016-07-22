////
////  DataSource.swift
////  DisplayDataSource
////
////  Created by lehoanglong on 7/15/16.
////  Copyright © 2016 LeHoangLong. All rights reserved.
////
//
import UIKit


class DataSource: NSObject, UITableViewDataSource {
    var room:[Room] = {
        var result: [Room] = []
        for i in 0...10 {
            var miniResult = Room(numberOfStudents: 10, name: "10A\(i)")
            result += [miniResult]
        }
        return result
    }()

    // MARK: Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return room.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return room[section].students.count
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return room[section].name
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let addressBookCell = tableView.dequeueReusableCellWithIdentifier("tableViewCell")! as UITableViewCell
        addressBookCell.textLabel?.text = room[indexPath.section].students[indexPath.row]
        
        return addressBookCell
    }
    
    // MARK:Edit Table View
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            room[indexPath.section].students.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }

}