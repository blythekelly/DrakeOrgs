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
                .position(x: 200, y:15)
                .font(
                        .system(size: 34)
                        .weight(.heavy)
                )

        //vertical stack of rectangle buttons for club list
        VStack{
            Divider()
            ScrollView() {
                VStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        
                        //navigate to new page with information about club
                        NavigationLink(destination: DisplayTextView(text: studentOrgs[index])) {
                            Text("")}
                        
                        RectangleView(label:studentOrgs[index])
                    }
                }.padding()
            }.frame(height: 500)
            Divider()
            Spacer()
        }

        //bottom tab bar
        TabView {
            Text("")
                .tabItem {
                Image(systemName: "doc.text.magnifyingglass")
                Text("Explore")
                  }
            Text("")
                .tabItem {
                Image(systemName: "calendar")
                Text("Clubs and Events")
                  }
            Text("")
                .tabItem {
                Image(systemName: "square.and.pencil")
                Text("Submit Information")
                  }
            }
            
        }
    }
}



