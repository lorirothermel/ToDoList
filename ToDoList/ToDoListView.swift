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

                
            }  // List
            .navigationTitle("ToDo List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
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
                    DetailView(toDo: ToDo(), newToDo: true)   // new value
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
