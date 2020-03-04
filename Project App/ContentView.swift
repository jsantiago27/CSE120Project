//
//  ContentView.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/12/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showImagePicker: Bool = false
    @State var image: Image? = Image("Garfield")
    @State var showActionSheet:Bool = false
    @State var sourceType: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                
                MapView()
                    .offset(y: -50)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                    
                Text("Hello Madafaka!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .offset(y: -200)
                    .foregroundColor(.white)
                
                VStack {
                    image?
                        .resizable()
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 160, height: 160)
                        .aspectRatio(contentMode: .fill)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 2.0)
                        )
                        .shadow(radius: 10)
                        .overlay(
                            Camera(showActionSheet: $showActionSheet)
                                .offset(x: 60, y:65)
                        )
                }
            }
            .actionSheet(isPresented: $showActionSheet, content: { () -> ActionSheet in
                    ActionSheet(title: Text("Select Image"), message: Text("Please select an image from the gallery or use the camera"), buttons: [ActionSheet.Button.default(Text("Camera"),action: {
                        self.sourceType = 0
                        self.showImagePicker.toggle()
                    }),
                    ActionSheet.Button.default(Text("Photo Gallery"), action: {
                        self.sourceType = 1
                        self.showImagePicker.toggle()
                        
                    }),
                    
                    ActionSheet.Button.cancel()
                ])
            })
            if showImagePicker {
                ImagePicker(isShown: $showImagePicker, image: $image, sourceType: sourceType)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
