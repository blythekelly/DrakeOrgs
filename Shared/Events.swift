//
//  Events.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/21/24.
//

import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let location: String
}

struct UpcomingEvents: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            Text(event.date)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(event.location)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 200, height: 150)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
