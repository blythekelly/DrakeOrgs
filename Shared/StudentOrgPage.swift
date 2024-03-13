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
            VStack(alignment: .leading, spacing: 10) {
                Text("Description:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(orgDescription)
                    .padding()
                    .font(.body)
            }
            
            Divider()
            
            // Contact information
            VStack(alignment: .leading, spacing: 10) {
                Text("Contact:")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(contactInfo)
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
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            if let description = json["description"] as? String {
                                self.orgDescription = description
                            } else {
                                print("Invalid JSON format or missing 'description' field")
                            }
                            
                            if let contactInfo = json["contact-info"] as? String {
                                self.contactInfo = contactInfo
                            } else {
                                print("Invalid JSON format or missing 'contact-info' field")
                            }
                        } else {
                            print("Invalid JSON format")
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
    
    // Function to fetch organization data
    func fetchOrganizationData(orgName: String, completion: @escaping (Result<Data, Error>) -> Void) {
        // Construct the URL
        let orgNameEncoded = orgName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://d4kfv1hyq7.execute-api.us-east-1.amazonaws.com/DrakeOrgs-API/get?org-name=\(orgNameEncoded)"
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        
        // Create the URLSession
        let session = URLSession.shared
        
        // Create the data task
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                _ = (response as? HTTPURLResponse)?.statusCode ?? -1
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP response status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)"])
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            // Call completion handler with the received data
            completion(.success(data))
        }
        
        // Start the task
        task.resume()
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
