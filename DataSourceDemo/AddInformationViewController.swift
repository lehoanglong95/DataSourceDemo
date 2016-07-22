//
//  AddInformationViewController.swift
//  DisplayDataSource
//
//  Created by lehoanglong on 7/15/16.
//  Copyright © 2016 LeHoangLong. All rights reserved.
//

import UIKit

class AddInformationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var clasNameTextField: UITextField!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let name = name {
            addTextField.text = name
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Action
    
       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
