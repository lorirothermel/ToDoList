//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var newTodo = ""
    @State private var sheetIsPresented = false
    
    
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change the World",
                 "Bring the Awesome",
                 "Take a Vacation"]
    
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
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
                DetailView(passedValue: "")
            }  // .sheet
//            .fullScreenCover(isPresented: $sheetIsPresented) {
//                DetailView(passedValue: "")
//            }  // .sheet
            
            
        }  // NavigationStack
    }  // some View
    
}  // ToDoListView

#Preview {
    ToDoListView()
}
