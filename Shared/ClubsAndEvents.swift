//
//  ClubsAndEvents.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/14/24.
//

import SwiftUI

struct ClubsView: View {
    var body: some View {
        //vertical stack of app content
        VStack {
            //title of the page
            Text("DrakeOrgs")
                .font(
                        .system(size: 34)
                        .weight(.heavy)
                ).foregroundColor(Color(UIColor(hex: "#004477")!))
            
            let events: [Event] = [
                    Event(title: "Nelson Student Research Symposium", date: "March 8 From 12:30-4:30PM", location: "Collier Scripps 3rd Floor"),
                    Event(title: "Annual Juried Student Exhibition", date: "March 24 from 1-3PM", location: "Anderson Gallery"),
                    Event(title: "Global Citizenship Showcase", date: "March 7 from 8:30-10:00 AM", location: "Cowles Library Reading Room"),
                    Event(title: "Citizen Diplomacy Documentary Screening", date: "March 7 from 6:30-8:30 PM", location: "Harkin Institute"),
                    Event(title: "Post-Graduate Global Scholarship Info Session", date: "March 7 from 4:30-5:00 PM", location: "Upper Olmsted, CR 310"),
                    Event(title: "Justice Program DSM", date: "March 15-17", location: "TBD"),
                    // Add more events as needed
                ]
            
                
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(events) { event in
                        UpcomingEvents(event: event)
                        }
                    }
                    .padding()
                }
                

        //vertical stack of rectangle buttons for club list
        VStack{
            Divider()
            ScrollView() {
                VStack(spacing: 10) {
                    ForEach(0..<130) { index in
                        //navigate to new page with information about club
                        OrganizationButtonView(orgName: studentOrgs[index])
                    }
                }.padding()
            }.frame(height: 500)
                .background(Color(UIColor(hex: "#EAEAEA")!))
            Divider()
            Spacer()
        }

            
        }
    }
    
struct ClubsandEventsView_Previews: PreviewProvider {
        static var previews: some View {
            ClubsView()
        }
    }
}
