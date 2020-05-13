//
//  ImagePreview.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 4/9/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
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
        VStack {
            
            if(top) {
                Text(imageName)
                    .padding(.bottom, 40)
                    .foregroundColor(Color.black)
            }
            Button(action: {
                self.showImagePicker.toggle()
            }) {
                Text(" ")
                    .frame(width: 180, height: 180)
            }
            .background(
                imageData.image
                    .resizable()
                    .frame(width: 180, height: 180)
                    .scaledToFit()
                    .shadow(radius: 5)
            )
            .frame(width: 120, height: 120)
            
            
            if(!top) {
               Text(imageName)
                    .padding(.top, 40)
                    .foregroundColor(Color.black)
           }
            //.padding(5)
            //  .padding(.leading, 30)
            
            //Spacer()
            
            //VStack(alignment: .leading) {
                /*
                Text(String("Focal Length: \(imageData.focalLength())"))
                    .font(.caption)
                    .fontWeight(.thin)
                
                Text(String("Magnification: \(imageData.magnification())"))
                    .font(.caption)
                    .fontWeight(.thin)
                
                Text(String("Longitude: \(imageData.location.coordinate.longitude)"))
                    .font(.caption)
                    .fontWeight(.thin)
                    
                Text(String("Latitude: \(imageData.location.coordinate.latitude)"))
                    .font(.caption)
                    .fontWeight(.thin)
                
                Text(String("Object Height: \(imageData.imagePixelHeight())"))
                .font(.caption)
                .fontWeight(.thin)
                */
                /*
                Button(action: {
                    self.showImagePicker.toggle()
                    //self.imageData = ImageData(image: self.imageMain ?? Image("Garfield"), location: self.photoLocation ?? CLLocation(), focalLength: self.focalLengthMain ?? 0)
                }) {
                    Text("Image\n(imageName)")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                        .lineLimit(2)
                }
                .padding(10)
                .frame(width: 150.0)
                .background(Color.green)
                .padding(.vertical, 10)
                */
            
            //}
        }.sheet(isPresented: self.$showImagePicker) {
            ImagePicker(isShown: self.$showImagePicker, image: self.$imageData.image, location: self.$imageData.location, imgMetaData: self.$imageData.imgMetaData, sourceType: self.sourceType)
            .overlay(
                Dot()
            )
        }
        .padding(30)
        
    }
}

struct ImagePreview_Previews: PreviewProvider {
    //@ObservedObject static var imageData: ImageData = ImageData()
    
    static var previews: some View {
        ImagePreview(top: false, imageName: "Main Image")
        
    }
}
