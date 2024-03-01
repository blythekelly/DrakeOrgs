//
//  ContentView.swift
//  Shared
//
//  Created by Blythe Kelly on 2/12/24.
//

import SwiftUI


//list of interest categories
let interests=["Academic","Governing","Honors", "Media", "Cultural", "Panhellenic", "Professional", "Religious", "Social", "Interest", "Sports"]


struct ContentView: View {
    var body: some View {

        NavigationView{
            
        //vertical stack of app content
        VStack(spacing: 20) {
                        Text("DrakeOrgs")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(hex: "#004477")!))
                        
                        Text("What is your interest?")
                            .font(.title3)
                            .foregroundColor(Color(UIColor(hex: "#004477")!))
            
            //Horizontal stack of interest filters
            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(interests, id: \.self) { interest in
                                        CircleView(label: interest)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 60)
                            
                            Divider()
        
        //vertical stack of rectangle buttons for club list
        VStack{
            Divider()
            ScrollView() {
                VStack(spacing: 2) {
                    ForEach(0..<10) { index in
                        RectangleView(label:studentOrgs[index])
                    }
                }.padding()
            }.frame(height: 480)
            Divider()
            Spacer()
        }.navigationBarHidden(true)
            
    
    
    //Bottom Navigation Bar for directing between views
    HStack(spacing: 55){
        NavigationLink(destination:ContentView()){
            VStack{
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 20))
            Text("Explore").font(
                .system(size: 13)
        )
            }
        }
            
        NavigationLink(destination:ClubsView()){
            VStack{
            Image(systemName: "calendar").font(.system(size: 20))
            Text("Org List").font(
                .system(size: 13)
        )
            }
        }
        NavigationLink(destination:SubmitFormView()){
            VStack{
            Image(systemName: "square.and.pencil").font(.system(size: 20))
            Text("Submit Event").font(
                .system(size: 13)
        )
            }
        }
        } .foregroundColor(Color(UIColor(hex: "#004477")!))
                .padding(.horizontal)
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


