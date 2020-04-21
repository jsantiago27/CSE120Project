//
//  ImagePreview.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/9/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ImagePreview: View {
    
    @State var showImagePicker: Bool = false
    @State var sourceType: Int = 0
    @State var imageMain: Image? = Image(systemName: "camera.fill")
    @State var focalLengthMain: Double? = 0
    @State var photoLocation: CLLocation?
    
    var top: Bool
    var imageName: String
    
    var body: some View {
        HStack {
            
           /*if(top) {
               Button(action: {
                   self.showImagePicker = true
                    
               }) {
                   Text("Image \(imageName)")
                       .font(.footnote)
                       .multilineTextAlignment(.center)
                       .foregroundColor(Color.black)
               }
               .padding(10)
               .background(Color.green)
               .padding(.bottom, 10)
           }
             */
            VStack(alignment: .leading) {
                imageMain?
                    .resizable()
                    .scaledToFit()
                    //.overlay(Rectangle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 5)
                    .frame(width: 120, height: 120)
                    .padding(5)
                
                /*
                if(top == false) {
                    Button(action: {
                        self.showImagePicker = true
                    }) {
                        Text("Image \(imageName)")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                    }
                    .padding(10)
                    .background(Color.green)
                    .padding(.top, 10)
                    
                }
                 */
            
                
                Text(String("Focal Length: \(focalLengthMain ?? 0)"))
                    .font(.subheadline)
                
                Text(String("Longitude: \(photoLocation?.coordinate.longitude ?? 0)"))
                    .font(.subheadline)
                    
                Text(String("Latitude: \(photoLocation?.coordinate.latitude ?? 0)"))
                    .font(.subheadline)
            }
            .frame(width: 150, height: 150)
            //.padding(.horizontal, 20.0)
            
            Spacer()
            
            Button(action: {
                self.showImagePicker.toggle()
            }) {
                Text("Image \(imageName)")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
            }
            .padding(10)
            .frame(width: 150.0)
            .background(Color.green)
            .padding(.bottom, 10)
            
        }.sheet(isPresented: self.$showImagePicker) {
            //self.locationManager.requestWhenInUseAuthorization()
            
            //ImagePicker(isShown: self.$showImagePicker, isShown: self.$imageMain, image: self.$focalLengthMain, focalLength: self.sourceType, location: self.$photoLocation)
            ImagePicker(isShown: self.$showImagePicker, image: self.$imageMain, focalLength: self.$focalLengthMain, location: self.$photoLocation, sourceType: self.sourceType)
            .overlay(
                Dot()
            )
        }
        .padding(10)
        
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview(top: true, imageName: "Main Image")
    }
}
