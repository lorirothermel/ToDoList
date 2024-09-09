//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false
    
    
    var passedValue: String
    
    
    var body: some View {
        
        NavigationStack {
            
            List {
                TextField("Enter to Do Here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder: ", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!reminderIsOn)
                
                Text("Notes:")
                    .padding(.top, 25)
                
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed: ", isOn: $isCompleted)
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
                        // TODO: Save 
                    }  // Button
                }  // ToolbarItem - Save
                
            }  // .toolbar
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(passedValue)
                        
        }  // NavigationStack
        
    }  // some View
}  // DetailView

#Preview {
    DetailView(passedValue: "Item 1")
}
