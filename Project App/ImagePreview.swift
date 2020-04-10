//
//  ImagePreview.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/9/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct ImagePreview: View {
    var top: Bool
    var imageName: String
    
    var body: some View {
        
        VStack {
        if(top) {
        Text("Image \(imageName)")
            .font(.footnote)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.black)
        }
        
        Image("Garfield")
            .resizable()
            .overlay(Rectangle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 5)
            .frame(width: 130, height: 180)
            
        if(top == false) {
            Text("Image \(imageName)")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
        }

        }
        
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview(top: true, imageName: "Main Image")
    }
}
