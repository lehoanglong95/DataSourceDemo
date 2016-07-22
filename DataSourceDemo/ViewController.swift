//
//  ViewController.swift
//  DataSourceDemo
//
//  Created by lehoanglong on 7/20/16.
//  Copyright © 2016 LeHoangLong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var dataSource = DataSource()
    var addressBook: [String] = {
        var result: [String] = []
        for i in 0 ..< 101 {
            result += ["Nguyen Van \(i)"]
        }
        return result
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cancel"
        self.navigationItem.backBarButtonItem = backItem
    }
    
    @IBAction func backToViewController(segue: UIStoryboardSegue){
        let vc = segue.sourceViewController as! AddInformationViewController
        guard let addClassName = vc.clasNameTextField.text else {
            return
        }
        guard let addedString = vc.addTextField.text else {
            return
        }
        
        var sectionHadExist = false
        for i in 0..<dataSource.room.count {
            if dataSource.room[i].name == addClassName {
                dataSource.room[i].students += [addedString]
                sectionHadExist = true
            }
        }
        if !sectionHadExist {
            var result: [String] = []
            result.append(addedString)
            let newRoom = Room(students: result, name: addClassName)
            dataSource.room += [newRoom]
            
            
            //}
        }
    }
    
    // MARK: EditTableView
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "Edit Information", message: "Edit StudentName", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) in
           textField.placeholder = "NewStudentName"
        }
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel, handler:nil))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:{ (UIAlertAction)in
            let textField = alert.textFields![0]
            self.dataSource.room[indexPath.section].students[indexPath.row] = textField.text!
            tableView.reloadData()
        }))
        self.presentViewController(alert, animated: true, completion: {
        })
    }
    
    
    
}

