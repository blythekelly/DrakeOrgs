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
                .fill(.black)
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
                .fill(Color.black)
                .frame(width: 300.0, height: 80.0)
            Text(label).foregroundColor(.white)
        }
        }
        //once button is pressed, send label data to club page
        .sheet(isPresented: $isButtonPressed) {
            DisplayTextView(text: self.label)
        }
}
}
