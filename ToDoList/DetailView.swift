//
//  DetailView.swift
//  ToDoList
//
//  Created by Lori Rothermel on 9/7/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You Are A Swifty Legend!!!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
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
    DetailView()
}
