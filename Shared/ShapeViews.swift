//
//  ShapeViews.swift
//  DrakeOrgs
//
//  Created by Blythe Kelly on 2/17/24.
//

import SwiftUI

struct CircleView: View {
    @State var label: String
    
    //creates oval-shaped buttons for interest filters
    var body: some View {
        Button(action: {
        }){
        ZStack {
            Ellipse()
                .fill(Color(UIColor(hex: "#004477")!))
                .frame(width: 100, height: 80)
            Text(label).foregroundColor(.white)
        }
        }
    }
}

//creates rectangle buttons for list of clubs
struct RectangleView: View {
    @State var label: String
    @State private var isButtonPressed: Bool = false
    
    var body: some View {
        Button(action: {
            self.isButtonPressed = true
        }){
        ZStack {
            Rectangle()
                .fill(Color(UIColor(hex: "#004477")!))
                .frame(width: 300.0, height: 80.0)
            Text(label).foregroundColor(.white)
        }
        }
        //once button is pressed, send label data to club page
        .sheet(isPresented: $isButtonPressed) {
            DisplayTextView(orgName: self.label)
        }
}
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

struct OrganizationButtonView: View {
    let orgName: String
    @State private var interest: String = ""
    @State private var isButtonPressed: Bool = false
    
    var body: some View {
        Button(action: {
            self.isButtonPressed = true
        }) {
            VStack {
                Text(orgName)
                    .font(.system(size: 24, weight: .bold))
                    .font(.headline)
                    .foregroundColor(.black)
                Text(interests.isEmpty ? "Loading..." :interest)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(UIColor(hex: "#004477")!))
                    )
            }
        }
        .onAppear {
                    fetchOrganizationData(orgName: orgName) { result in
                        switch result {
                        case .success(let data):
                            do {
                                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                                    print("Invalid JSON format")
                                    return
                                }
                                
                                guard let interest = json["interest"] as? String else {
                                    print("Missing 'interest' field")
                                    return
                                }
                                DispatchQueue.main.async {
                                    self.interest = interest // Update the interest property on the main thread
                                }
                            } catch {
                                print("Error parsing JSON:", error)
                            }
                        case .failure(let error):
                            print("Error fetching organization data:", error)
                        }
                    }
                }
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(Color.white)
                .cornerRadius(10)
                //once button is pressed, send label data to club page
                .sheet(isPresented: $isButtonPressed) {
                    DisplayTextView(orgName: self.orgName)
                }
    }
}

