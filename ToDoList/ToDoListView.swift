//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI
import SwiftData

enum SortOption: String, CaseIterable {
    case asEntered = "As Entered"
    case alphabetical = "A-Z"
    case chronological = "Date"
    case completed = "Not Done"
}  // enum

struct SortedToDoList: View {
    @Environment(\.modelContext) var modelContext
    @Query var toDos: [ToDo]
    let sortSelection: SortOption
    
    init(sortSelection: SortOption) {
        self.sortSelection = sortSelection
        
        switch self.sortSelection {
        case .asEntered:
            _toDos = Query()
        case .alphabetical:
            _toDos = Query(sort: \.item, order: .forward)
        case .chronological:
            _toDos = Query(sort: \.dueDate)
        case .completed:
            _toDos = Query(filter: #Predicate { $0.isCompleted == false })
        }  // switch
    }  // init
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle": "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                            }  // .onTapGesture
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }  // NavigationLink
                        
                    }  // HStack
                    .font(.title2)
                    HStack {
                        Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                            .foregroundColor(.secondary)
                        if (toDo.reminderIsOn) {
                            Image(systemName: "calendar.badge.clock")
                                .symbolRenderingMode(.multicolor)
                        }  // if
                        
                    }  // HStack
                    
                }  // VStack
                .swipeActions {
                    Button("Delete", role: .destructive) {
                        modelContext.delete(toDo)
                    }  // Button
                }  // .swipeActions
                
                
            }  // ForEach
            
        }  // List
        .listStyle(.plain)
        
    }  // some View
}  // SortedToDoList

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @State private var sortSelection: SortOption = .asEntered
        
    var body: some View {
        NavigationStack {
            SortedToDoList(sortSelection: sortSelection)
                .navigationTitle("To Do List")
                .navigationBarTitleDisplayMode(.automatic)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            sheetIsPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }  // Button
                    }  // ToolbarItem - plus
                
                    ToolbarItem(placement: .bottomBar) {
                        Picker("", selection: $sortSelection) {
                            ForEach(SortOption.allCases, id: \.self) { sortOrder in
                                Text(sortOrder.rawValue)
                            }  // ForEach
                        }  // Picker
                        .pickerStyle(.segmented)
                    
                    }  // ToolbarItem - bottom bar
                }  // .toolbar
                .sheet(isPresented: $sheetIsPresented) {
                    NavigationStack {
                        DetailView(toDo: ToDo())   // new value
                    }  // NavigationStack
                }  // .sheet
            
            }  // NavigationStack
        
        
    }  // some View
    
}  // ToDoListView

#Preview {
    ToDoListView()
        .modelContainer(for: ToDo.self)
}
