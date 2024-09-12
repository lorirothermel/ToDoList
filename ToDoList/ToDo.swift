//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/9/24.
//

import Foundation
import SwiftData


class ToDo: ObservableObject {
    
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
    
}  // class ToDosViewModel
