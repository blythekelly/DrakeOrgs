//
//  StudentOrgPage.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/18/24.
//

import SwiftUI
import Foundation


// View for the org page that displays the text from the button
struct DisplayTextView: View {
    var text: String
    @Environment(\.presentationMode) var presentationMode
    
    var upcomingEvents = ["Past Event", "Past Event", "Past Event", "Past Event"] // Sample upcoming events
    
    var body: some View {
        VStack(spacing: 20) {
            // Navigation bar with back button
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss() // Dismiss the current view
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding(.leading, 10)
                
                Spacer()
            }
            
            // Title
            Text(text)
                .font(.title)
                .fontWeight(.bold)
            
            Divider()
            
            // Organization description
            VStack(alignment: .leading, spacing: 10) {
                Text("Description:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, nisi et consequat fermentum, nunc nunc placerat risus, et facilisis neque nisi a leo.")
                    .padding()
                    .font(.body)
            }
            
            Divider()
            
            // Contact information
            VStack(alignment: .leading, spacing: 10) {
                Text("Contact:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("contact@example.com")
                    .font(.body)
            }
            .padding(.horizontal)
            Divider()
            
            // Upcoming events
            VStack(alignment: .leading) {
                Text("Upcoming Events")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(upcomingEvents, id: \.self) { event in
                            EventCard(title: event)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct EventCard: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .padding()
                .frame(width: 150, height: 100)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 2)
        }
    }
}

struct DisplayTextView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTextView(text: "Women in STEM")
    }
}

