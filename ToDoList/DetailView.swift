//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var passedValue: String
    
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You passed over the value -> \(passedValue)")
                .font(.title)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Spacer()
            
            Button("Backwards") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .foregroundColor(.white)
            
        }  // VStack
        .padding()
        
    }
}

#Preview {
    DetailView(passedValue: "Item 1")
}
