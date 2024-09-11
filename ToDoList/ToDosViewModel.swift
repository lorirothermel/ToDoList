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
        loadData()
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
        saveData()
    }  // func saveToDo
    
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }  // func Delete
    
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }  // func move
    
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)  // try? means if error is thrown data = nil
        
        do {
            try data?.write(to: path)
        } catch {
            print("🤬 ERROR: Could not save data \(error.localizedDescription)")
        }  // do catch
        
    }  // func saveData
    
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("🤬 ERROR: Could not load data \(error.localizedDescription)")
        }  // do catch
        
    }  // func loadData
    
    
    
}  // class ToDosViewModel
