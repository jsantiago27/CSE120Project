//
//  ContentView.swift
//  Project App
//
//  Created by Jefferson Santiago on 2/12/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI
import CoreLocation
import Combine

struct ContentView: View {
    @ObservedObject var lm = LocationManager()
    @Environment(\.horizontalSizeClass) var sizeHClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var sizeVClass: UserInterfaceSizeClass?

    
    @State var showResult: Bool = false
    
    @ObservedObject var mainImage: ImageData
    @ObservedObject var leftImage: ImageData
    @ObservedObject var rightImage: ImageData
    
    var body: some View {
        ZStack() {
            Color(#colorLiteral(red: 0.9720847011, green: 0.7606303096, blue: 0.5701220632, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10.0) {
                if sizeVClass == .compact {
                    Image("icon")
                        .resizable()
                        .clipShape(Rectangle())
                        .frame(width:100, height: 100)
                }
                else {
                    Image("icon")
                        .resizable()
                        .clipShape(Rectangle())
                        .frame(width:100, height: 100)
                        .padding(.top, 50.0)
                }
                
                Spacer()

                VStack {
                    ImagePreview(imageData: mainImage, top: true, imageName: "Main Image")
                    //    .padding(.bottom, 10.0)
                    
                   // HStack(spacing: 20.0) {
                    ImagePreview(imageData: leftImage, top: false, imageName: "Left Side Image")
                    ImagePreview(imageData: rightImage, top: false, imageName: "Right Side Image")
                    //}
                    .padding(.bottom, 10.0)
                    
                    
                    
                    Button(action: {
                        self.showResult.toggle()
                    }, label: {
                        Text("Pinpoint")
                        .padding(.horizontal, 20.0)
                        .padding(.vertical, 5.0)
                        .background(Color(hue: 0.105, saturation: 0.201, brightness: 0.982))
                    }).sheet(isPresented: $showResult, content: {
                        FinalResultView()
                    })
                }
                .padding(.bottom, 50.0)
            }
            
            Button(action: {
                
            }) {
                Image("setting_icon")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:25, height: 25)
                    .foregroundColor(Color.black)
                    .offset(x:150, y: -320)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mainImage: ImageData(), leftImage: ImageData(), rightImage: ImageData())
    }
}
