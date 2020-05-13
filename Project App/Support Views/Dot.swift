//
//  Dot.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 4/14/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
//

import SwiftUI

struct Dot: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Aim the dot to the point of interest")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(10)
            
            ZStack() {
                Circle()
                    .foregroundColor(Color(red: 0, green: 1, blue: 1))
                    .shadow(radius: 10)
                    .frame(width: 8)
                
                Rectangle()
                    .frame(width:200, height: 200)
                    .opacity(0)
                    .border(Color(red: 0, green: 1, blue: 1))
            }
            .offset(y: -95)
                
        }
    }
}

struct Dot_Previews: PreviewProvider {
    static var previews: some View {
        Dot()
    }
}
