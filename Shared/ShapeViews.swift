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
