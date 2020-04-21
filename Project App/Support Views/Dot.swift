//
//  Dot.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/14/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct Dot: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Aim the dot to the point of interest")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(10)
            
            Circle()
                .offset(y: -85)
                .foregroundColor(Color.gray)
                .shadow(radius: 10)
                .frame(width: 8)
                
        }
    }
}

struct Dot_Previews: PreviewProvider {
    static var previews: some View {
        Dot()
    }
}
