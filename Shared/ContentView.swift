//
//  ContentView.swift
//  Shared
//
//  Created by Blythe Kelly on 2/12/24.
//

import SwiftUI



//list of interest categories
let interests=["Academic","Governing","Honors", "Media", "Cultural", "Panhellenic", "Professional", "Religious", "Social", "Interest", "Sports"]

//will be replaced by API call
let studentOrgs=[
                 "American College of Pharmaceutical Scientists, Student Chapter",
                 "Academy of Managed Care Pharmacy",
                "CBPA Ambassadors",
                "Chemistry Club",
                "CPHS Ambassadors",
                "DATA Club",
                "Drake Math Club",
                "Drake Pharmacy DRxUGS",
                "Occupational Therapy (DUSOTA)",
                 "Drake Simulation League",
                "Honors Program Student Council",
                "Investment Club",
                "Pre-Med Club",
                "Society of Physics Students",
                "Student Leadership Advisory Panel",
                "Women in STEM"]


struct ContentView: View {
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
            //button  prompt for interests
            Text("What is your interest?")
            
            //Horizontal stack of interest filters
            Divider()
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        CircleView(label:interests[index])
                    }
                }.padding()
            }.frame(height: 100)
            Divider()
            Spacer()
        
        //vertical stack of rectangle buttons for club list
        VStack{
            Divider()
            ScrollView() {
                VStack(spacing: 2) {
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
            
            NavigationView {
                    ClubsView() // Directly navigate to ClubsView
                }
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




// Preview
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)

    }
}
#endif


