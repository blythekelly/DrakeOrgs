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
    @State private var searchText = ""
    @State private var filteredStudentOrgs = studentOrgs
    @State private var isFilterSheetPresented = false
    @State private var selectedInterests: [String] = []

    
    var body: some View {

        NavigationView{
            
        //vertical stack of app content
        VStack(spacing: 20) {
                        Text("DrakeOrgs")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor(hex: "#004477")!))
        
            HStack{
                // Search Bar
                SearchBar(text: $searchText, placeholder: "Search clubs")
                
                // Filter Button
                Button(action: {
                    isFilterSheetPresented.toggle()
                }) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 20))
                    .foregroundColor(Color(UIColor(hex: "#8e8e93")!))
                                   }
                    .padding(.trailing)
            }
            
                        
                        Text("Filter by interest:")
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
                    ForEach(filteredStudentOrgs.prefix(10), id: \.self) { org in
                        OrganizationButtonView(orgName: org)
                    }
                }.padding()
            }.frame(height: 420)

            Divider()
            Spacer()
        }.navigationBarHidden(true)
        .background(Color(UIColor(hex: "#EAEAEA")!))
            
    
    
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
                    
                NavigationLink(destination:ClubsView(events: [])){
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
        .onChange(of: searchText) { newValue in
            if newValue.isEmpty {
                filteredStudentOrgs = studentOrgs
            } else {
                filteredStudentOrgs = studentOrgs.filter { $0.localizedCaseInsensitiveContains(newValue) }
            }
        }
        .sheet(isPresented: $isFilterSheetPresented) {
            FilterSheetView(selectedInterests: $selectedInterests, interests: interests)
        }

    }
    }
    }
            

struct FilterSheetView: View {
    @Binding var selectedInterests: [String]
    let interests: [String]

    var body: some View {
        VStack {
            Text("Select Interests")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(interests, id: \.self) { interest in
                        FilterButton(interest: interest, isSelected: selectedInterests.contains(interest)) {
                            if selectedInterests.contains(interest) {
                                selectedInterests.removeAll { $0 == interest }
                            } else {
                                selectedInterests.append(interest)
                            }
                        }
                    }
                }
                .padding()
            }

            Button("Apply Filters") {
                // Apply filter logic here
            }
            .padding()
        }
    }
}

struct FilterButton: View {
    let interest: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(interest)
                .font(.body)
                .fontWeight(.semibold)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(isSelected ? Color(UIColor(hex: "#004477")!) : Color(UIColor(hex: "#8e8e93")!))
                .foregroundColor(.white)
                .cornerRadius(8)
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


