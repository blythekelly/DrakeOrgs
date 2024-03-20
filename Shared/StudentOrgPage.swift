import SwiftUI
import Foundation

struct DisplayTextView: View {
    @State private var orgDescription: String = ""
    @State private var contactInfo: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    let orgName: String
    
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
            Text(orgName)
                .font(.title)
                .fontWeight(.bold)
            
            Divider()
            
            // Organization description
            VStack {
                Text("Description:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(orgDescription)
                    .padding()
                    .font(.body)
            }
            
            Divider()
            
            // Contact information
            VStack {
                Text("Contact:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(contactInfo)
                    .font(.body)
            }
            .padding(.horizontal)
            Divider()
            
            // Upcoming events
            VStack {
                Text("Upcoming Events")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(["Past Event", "Past Event", "Past Event", "Past Event"], id: \.self) { event in
                            EventCard(title: event)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            fetchOrganizationData(orgName: orgName) { result in
                switch result {
                case .success(let data):
                    do {
                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                            print("Invalid JSON format")
                            return
                        }
                        
                        guard let description = json["description"] as? String else {
                            print("Missing 'description' field")
                            return
                        }
                        self.orgDescription = description
                        
                        if let contactInfo = json["contact-info"] as? String {
                            self.contactInfo = contactInfo
                        } else {
                            print("Missing 'contact-info' field")
                        }
                    } catch {
                        print("Error parsing JSON:", error)
                    }
                case .failure(let error):
                    print("Error fetching organization data:", error)
                }

            }
        }
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
        DisplayTextView(orgName: "Women in STEM")
    }
}
