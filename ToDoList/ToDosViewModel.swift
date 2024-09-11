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
        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
    }  // init
        
    
    func saveToDo(toDo: ToDo) {
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id }) {
                toDos[index] = toDo
            }  // if
        }  // if else
    }  // func saveToDo
    
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }  // func Delete
    
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }  // func move
    
    
    
}  // class ToDosViewModel
