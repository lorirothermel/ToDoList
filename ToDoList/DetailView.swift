//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    
    
    var body: some View {
        
        List {
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder: ", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            
            Text("Notes:")
                .padding(.top, 25)
            
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed: ", isOn: $toDo.isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            
        }  // List
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }  // Button
            }  // ToolbarItem - Cancel
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }  // Button
            }  // ToolbarItem - Save
            
        }  // .toolbar
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(toDo.item)
                
    }  // some View
}  // DetailView

#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .environmentObject(ToDosViewModel())
    }  // NavigationStack
    
}
