//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI
import SwiftData


@main
struct ToDoListApp: App {
        
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }  // WindowGroup
    }  // some Scene
}
