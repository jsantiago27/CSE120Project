//
//  ImagePreview.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/9/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI
import CoreLocation
import Combine


struct ImagePreview: View {
    
    @State private var showImagePicker: Bool = false
    @State private var sourceType: Int = 0
    //@State private var imageMain: Image? = Image(systemName: "camera.fill")
    //@State private var focalLengthMain: Double? = 0
    //@State private var photoLocation: CLLocation?
    
    @ObservedObject var imageData: ImageData = ImageData()
    
    
    //@Binding var imageData: ImageData
    
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
                imageData.image
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
            
                
                Text(String("Focal Length: \(imageData.focalLength ?? 0)"))
                    .font(.subheadline)
                
                Text(String("Longitude: \(imageData.location.coordinate.longitude)"))
                    .font(.subheadline)
                    
                Text(String("Latitude: \(imageData.location.coordinate.latitude)"))
                    .font(.subheadline)
            }
            .frame(width: 150, height: 150)
            //.padding(.horizontal, 20.0)
            
            Spacer()
            
            Button(action: {
                self.showImagePicker.toggle()
                //self.imageData = ImageData(image: self.imageMain ?? Image("Garfield"), location: self.photoLocation ?? CLLocation(), focalLength: self.focalLengthMain ?? 0)
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
            ImagePicker(isShown: self.$showImagePicker, image: self.$imageData.image, focalLength: self.$imageData.focalLength, location: self.$imageData.location, sourceType: self.sourceType)
            .overlay(
                Dot()
            )
            
            
        }
        .padding(10)
        
    }
}

struct ImagePreview_Previews: PreviewProvider {
    //@ObservedObject static var imageData: ImageData = ImageData()
    
    static var previews: some View {
        ImagePreview(top: true, imageName: "Main Image")
        
    }
}
