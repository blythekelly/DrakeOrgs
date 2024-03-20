//
//  SubmitForm.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/20/24.
//
//
//  SubmitForm.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/20/24.
//
import SwiftUI

struct SubmitFormView: View {
    @State private var organizationName = ""
    @State private var contactName = ""
    @State private var contactEmail = ""
    @State private var eventDescription = ""
    @State private var eventLocation = ""
    @State private var date = Date()
    @State private var submitted = false // Track form submission

    @State private var events: [Event] = [] // Array to hold events

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Organization Information")) {
                        TextField("Organization Name", text: $organizationName)
                        TextField("Contact Name", text: $contactName)
                        TextField("Contact Email", text: $contactEmail)
                    }

                    Section(header: Text("Event Information")) {
                        TextField("Event Name", text: $eventDescription)
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                        TextField("Event Location", text: $eventLocation)
                    }

                    Button(action: submitForm) {
                        Text("Submit")
                    }
                }
                .navigationTitle("Submit Information")
                .alert(isPresented: $submitted) {
                    Alert(title: Text("Submitted"), message: nil, dismissButton: .default(Text("OK")))
                }
                
                Spacer() // Add a spacer to push the bottom navigation bar to the bottom
                
                // Bottom Navigation Bar for directing between views
                HStack(spacing: 55) {
                    NavigationLink(destination: ClubsView(events: events)) {
                        VStack {
                            Image(systemName: "calendar").font(.system(size: 20))
                            Text("Org List").font(
                                .system(size: 13)
                            )
                        }
                    }
                    NavigationLink(destination: SubmitFormView()) {
                        VStack {
                            Image(systemName: "square.and.pencil").font(.system(size: 20))
                            Text("Submit Event").font(
                                .system(size: 13)
                            )
                        }
                    }
                }
                .foregroundColor(Color(UIColor(hex: "#004477")!))
                .padding(.horizontal)
            }
        }
    }

    func submitForm() {
        let newEvent = Event(title: eventDescription, date: formatDate(date), location: eventLocation)
        events.append(newEvent)
        print("Event added:", newEvent)
        submitted = true
    }

    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter.string(from: date)
    }
}

struct SubmitFormView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitFormView()
    }
}

