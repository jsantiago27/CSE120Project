//
//  Camera.swift
//  Project App
//  Description: This file contains the presets and attributes of the camera icon
//
//  Created by team T͟Hē Lōkātərs on 3/3/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
//

import SwiftUI
import AVFoundation

struct CameraOverlay: View {
    // A binded variable that will be binded to the State variable in ContentView
    @Binding var showActionSheet: Bool
    var body: some View {
        Button(action: {
            // toggle() means sets the bool to either true or false
            self.showActionSheet.toggle()
        }) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 30, height: 30, alignment:  .center)
                .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 36, height: 36, alignment: .center)
                        .foregroundColor(Color.init(red: 232/255, green: 233/255, blue: 231/255))
                    .overlay(
                        Image(systemName: "camera.fill")
                        .foregroundColor(Color.black)
                    )
            )
        }
    }
}

struct CameraOverlay_Previews: PreviewProvider {
    static var previews: some View {
        CameraOverlay(showActionSheet: .constant(false))
            .previewLayout(.sizeThatFits) // scales the canvas to fit the image
            .padding() // Just add padding on all sides
    }
}

