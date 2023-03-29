//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var passedValue: String
    
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
            Text("You are a Swifty Legend!\n And you passed over the value \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button("Get Back") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
        }  // VStack
        .padding()
        
    }  // some View
}  // DetailView


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item 1")
    }
}
