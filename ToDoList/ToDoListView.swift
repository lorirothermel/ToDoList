//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    NavigationLink {
                        DetailView()
                    } label: {
                        Text("Winter")
                    }  // NavigationLink
                    
                    Text("Summer")
                    
                } header: {
                    Text("Breaks")
                }  // Section
                
                Section {
                    Text("Spring")
                    Text("Fall")
                } header: {
                   Text("Semesters")
                }  // Section
                            
            }  // List
            .navigationTitle("School Year")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }  // NavigationStack
    }  // some View
    
}  // ToDoListView

#Preview {
    ToDoListView()
}
