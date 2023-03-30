//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Lori Rothermel on 3/29/23.
//

import Foundation

class ToDosViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        // purgeData()
        loadData()
    }  // init
    
    func saveToDo(toDo: ToDo) {
        // if new, append to toDoVM.todos else update the toDo that was passed in from the list.
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }  // if let index
        }  // if newToDo
        saveData()
    }  // func saveToDo
    
    
    func toggleCompleted(toDo: ToDo) {
        // Don't try to update if toDos.id == nil
        guard toDo.id != nil else { return }
        
        // Copy toDo (a constant) into a newToDo (var) so we can update the isCompleted property
        var newToDo = toDo
        newToDo.isCompleted.toggle()   // Flips false to true and true to false
        
        // Find the id for newToDo in the array of toDos, then update the element at that index with the data in newToDo
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        saveData()
    }
    
    
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }  // func delete
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }  // func move
    
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)   // try? means if error is thrown data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("🤬 ERROR: Could NOT save data \(error.localizedDescription)")
        }  // do catch
    }  // func saveData
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("🤬 ERROR: Could NOT load data \(error.localizedDescription)")
        }  // do catch
    }  // func loadData
    
    
    func purgeData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
        do {
            try data?.write(to: path)
        } catch {
            print("🤬 ERROR: Could NOT save data \(error.localizedDescription)")
        }  // do catch
    }  // func purgeData
    
    
}
