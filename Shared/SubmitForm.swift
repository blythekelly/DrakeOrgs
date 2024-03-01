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
    
    var body: some View {
        NavigationView {
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
    }
    }
    
    func submitForm() {
        print("Submitted!")
        submitted = true
    }


struct SubmitFormView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitFormView()
    }
}
}
