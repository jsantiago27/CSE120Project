//
//  CircleImage.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/12/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    
    var body: some View {
        Image("Garfield")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 2.0)
            )
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
