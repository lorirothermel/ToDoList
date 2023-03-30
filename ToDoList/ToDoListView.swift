//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State private var sheetIsPresented = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    HStack {
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDosVM.toggleCompleted(toDo: toDo)
                                }
                            Text(toDo.item)
                        }  // NavigationLink
                    }  // HStack
                    .font(.title2)
                }  // ForEach
                // Shorthand calls to onDelete & onMove
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
                
                // Traditional Calls
                //                .onDelete { indexSet in
                //                    toDosVM.delete(indexSet: indexSet)
                //                }  // onDelete
                //                .onMove { fromOffsets, toOffset in
                //                    toDosVM.move(fromOffsets: fromOffsets, toOffset: toOffset)
                //                }  // onMove
            }  // List
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }  // ToolbarItem - Edit
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }  // Button - plus
                }  // ToolbarItem
            }  // toolbar
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())  // New Value
                }  // NavigationStack
            }  // sheet
        }  // NavigationStack
    }  // some View
}  // ToDoListView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}

