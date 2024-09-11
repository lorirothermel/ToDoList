//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/9/24.
//

import Foundation

class ToDosViewModel: ObservableObject {
    
    @Published var toDos: [ToDo] = []
        
    init() {
        // Temp Data here. Will eventually load in saved data.
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }  // init
        
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        if newToDo {
            toDos.append(toDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id }) {
                toDos[index] = toDo
            }  // if
        }  // if else
    }
    
    
    
}  // class ToDosViewModel
