//
//  StudentOrgPage.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/18/24.
//

import SwiftUI

// View for the org page that displays the text from the button
struct DisplayTextView: View {
    var text: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        VStack{
            // Back button with icon to navigate to ContentView
            Button(action: {
                self.presentationMode.wrappedValue.dismiss() // Navigate back to ContentView
            }) {
            Image(systemName: "arrow.left") // system-provided back arrow icon
                .foregroundColor(.black)
            }.position(x:50, y:20)
            
        Text(text)
            .padding()
            .font(.title)
            .position(x:200, y:0)
        Text("Description:").position(x:80)
        Text("Contact:").position(x:70)
        }
    }
}
