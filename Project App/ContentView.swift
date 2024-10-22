//
//  ContentView.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 2/12/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
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
        NavigationView {
            ZStack() {
                Color(#colorLiteral(red: 0.9720847011, green: 0.7606303096, blue: 0.5701220632, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 10.0) {
                    
                    VStack(spacing: 1) {
                        Image("icon")
                            .resizable()
                            .clipShape(Rectangle())
                            .frame(width:100, height: 100)
                        Text("iLocate")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, -30)
                    

                    VStack {
                        ImagePreview(imageData: mainImage, top: true, imageName: "Main Image")
                        //    .padding(.bottom, 10.0)
                        
                        Spacer()
                        
                        HStack() {
                       // HStack(spacing: 20.0) {
                            ImagePreview(imageData: leftImage, top: false, imageName: "Left Side Image")
                            
                            ImagePreview(imageData: rightImage, top: false, imageName: "Right Side Image")
                        }
                        //}
                        .padding(.bottom, 10.0)
                        
                        
                        /*
                        Button(action: {
                            self.showResult.toggle()
                        }, label: {
                            Text("Pinpoint")
                                .padding(.horizontal, 20.0)
                                .padding(.vertical, 5.0)
                                .background(Color(hue: 0.105, saturation: 0.201, brightness: 0.982))
                        }).sheet(isPresented: $showResult, content: {
                            FinalResultView(poiLoc: Delaunays(mainImage: self.mainImage, leftImage: self.leftImage, rightImage: self.rightImage).findPinpoint(), isReady: Delaunays(mainImage: self.mainImage, leftImage: self.leftImage, rightImage: self.rightImage).checkImages())
                        })
                        */
                        NavigationLink(destination: FinalResultView(poiLoc: Delaunays(mainImage: self.mainImage, leftImage: self.leftImage, rightImage: self.rightImage).findPinpoint(), isReady: Delaunays(mainImage: self.mainImage, leftImage: self.leftImage, rightImage: self.rightImage).checkImages())
                        ) {
                            Text("Pinpoint")
                                .padding(.horizontal, 20.0)
                                .padding(.vertical, 5.0)
                                .background(Color(hue: 0.105, saturation: 0.201, brightness: 0.982))
                        }
                        
                    }
                    .padding(.bottom, 10.0)
                }
                
                NavigationLink(destination: SettingMenu()) {
                    Image("info_icon")
                       .resizable()
                       .clipShape(Circle())
                       .frame(width:30, height: 30)
                       .foregroundColor(Color.black)
                }
                .offset(x:150, y: -350)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(mainImage: ImageData(), leftImage: ImageData(), rightImage: ImageData())
    }
}
