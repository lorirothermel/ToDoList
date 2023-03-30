//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI

struct DetailView: View {
   
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    @State var toDo: ToDo
         
    
    var body: some View {
        
        List {
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            Toggle("Set Reminder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            
            Text("Notes")
            TextField("Note", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            Toggle("Completed", isOn: $toDo.isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
            
        }  // List
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }  // Button - Cancel
            }  // ToolbarItem
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }  // Button - Save
            }  // ToolbarItem
        }  // toolbar
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        
    }  // some View
}  // DetailView


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(toDo: ToDo())
                .environmentObject(ToDosViewModel())
        }
    }
}
