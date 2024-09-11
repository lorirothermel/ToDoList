//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State private var newTodo = ""
    @State private var sheetIsPresented = false
    
    

    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(toDosVM.toDos) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }  // NavigationLink
                    .font(.title2)
                }  // ForEach
// Traditional Calls
//                .onDelete { indexSet in
//                    toDosVM.delete(indexSet: indexSet)
//                }  // .onDelete
//                .onMove { fromOffsets, toOffset in
//                    toDosVM.move(fromOffsets: fromOffsets, toOffset: toOffset)
//                }  // .onMove
//
// Shorthand Calls to .onDelete & .onMove
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
            }  // List
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                 ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }  // ToolbarItem - plus sign
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }  // Button
                }  // ToolbarItem - plus sign
             }  // .toolbar
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())   // new value
                }  // NavigationStack
            }  // .sheet
//            .fullScreenCover(isPresented: $sheetIsPresented) {
//                DetailView(passedValue: "")
//            }  // .sheet
            
            
        }  // NavigationStack
    }  // some View
    
}  // ToDoListView

#Preview {
    ToDoListView()
        .environmentObject(ToDosViewModel())
}
