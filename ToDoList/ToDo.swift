//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/9/24.
//

import Foundation
import SwiftData

@Model
class ToDo {
    
    @Attribute(.unique) var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false

    init(item: String = "", reminderIsOn: Bool = false, dueDate: Date = Date.now + (60*60*24), notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }  // init
    
    
}  // class ToDo
