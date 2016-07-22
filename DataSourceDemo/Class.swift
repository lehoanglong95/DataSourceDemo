//
//  Class.swift
//  DisplayDataSource
//
//  Created by lehoanglong on 7/18/16.
//  Copyright © 2016 LeHoangLong. All rights reserved.
//

import Foundation

struct Room {
    var students: [String]
    var name: String
    
    init(numberOfStudents: Int,name: String) {
        var result: [String] = []
        for i in 1...numberOfStudents {
            result += ["Nguyen Van \(i)"]
        }
        self.students = result
        self.name = name
    }
    
    init(students: [String], name: String){
        self.students = students
        self.name = name
    }
}