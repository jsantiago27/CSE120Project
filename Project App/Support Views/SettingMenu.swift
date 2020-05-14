//
//  SettingMenu.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 4/14/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
//

import SwiftUI

struct SettingMenu: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9720847011, green: 0.7606303096, blue: 0.5701220632, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Home Screen")
                    .font(.title)
                
                Text("Here, you will see the layout of 3 squares with a generic camera icon indicating the need to provide an image. Above each square, the label of main, left or right is given indicating the angle at which the pictures to be taken at.")
                .lineLimit(nil)
                .font(.subheadline)
                
                HStack(alignment: .top) {
                    Text("1.")
                        .font(.subheadline)
                    Text("Click the corresponding camera for the position you wish to take the image at.")
                        .lineLimit(nil)
                        .font(.subheadline)
                }
                
                HStack(alignment: .top) {
                    Text("a.")
                        .font(.subheadline)
                    Text("You will then be tasked to take a picture from the given camera")
                        .lineLimit(nil)
                        .font(.subheadline)
                }
                .padding(.leading, 30)
                
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack(alignment: .top) {
                        Text("i.")
                            .font(.subheadline)
                        Text("Note: Ensure the aqua pinpoint and bounded box is exact for every image")
                            .lineLimit(nil)
                            .font(.subheadline)
                    }
                    
                    HStack(alignment: .top) {
                        Text("ii.")
                            .font(.subheadline)
                        Text("Once the camera shutter goes off, then you can either use the photo if the pinpoint is nearly accurate or choose to retake the image")
                            .lineLimit(nil)
                            .font(.subheadline)
                    }
                    
                }.padding(.leading, 60)
                
                
                
                HStack(alignment: .top) {
                    Text("2.")
                        .font(.subheadline)
                    Text("If you decide to use the photo, then it will save in the corresponding position.")
                        .lineLimit(nil)
                        .font(.subheadline)
                }.padding(.bottom, 10)
                
                HStack(alignment: .top) {
                    Text("3.")
                        .font(.subheadline)
                    Text("Then you will need to do the first step again for the remaining two locations for which the two boxes are for.")
                        .lineLimit(nil)
                        .font(.subheadline)
                }.padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack(alignment: .top) {
                        Text("4.")
                            .font(.subheadline)
                        Text("Once all images are secured and to the user's liking, then you can go and click the \"Pinpoint\" button.")
                            .lineLimit(nil)
                            .font(.subheadline)
                    }
                    
                    HStack(alignment: .top) {
                        Text("a.")
                            .font(.subheadline)
                        Text("This will run some quick trigonometric calculations using a Triangulation Method in order to approximate the object of interest coordinate location.")
                            .lineLimit(nil)
                            .font(.subheadline)
                    }
                    .padding(.leading, 30)
                    
                }
                
                Text("Pinpoint Screen")
                .font(.title)
                
                HStack(alignment: .top) {
                    Text("5.")
                        .font(.subheadline)
                    Text("After the calculations run through, the app will go to another window that will show the location of the point of interest in the map along with its Coordinates in longitude and latitude.")
                        .lineLimit(nil)
                        .font(.subheadline)
                }.padding(.bottom, 10)
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            
        }
        .foregroundColor(Color.black)
        .navigationBarTitle(Text("How to use the application"), displayMode: .inline)
        
    }

}

struct SettingMenu_Previews: PreviewProvider {
    static var previews: some View {
        SettingMenu()
    }
}
