//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
