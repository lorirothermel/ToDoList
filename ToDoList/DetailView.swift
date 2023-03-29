//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI

struct DetailView: View {
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false
    
    @Environment(\.dismiss) var dismiss
    
    var passedValue: String
    
    
    var body: some View {
        
        List {
            TextField("Enter To Do Here", text: $toDo)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            Toggle("Set Reminder:", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            
            Text("Notes")
            TextField("Note", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            Toggle("Completed", isOn: $isCompleted)
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
                    // TODO: Add Save code here
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
            DetailView(passedValue: "Item 1")
        }
    }
}
