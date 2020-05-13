//
//  ImageData.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 4/22/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI
import Combine

/*
    Links:
    https://photo.stackexchange.com/questions/40865/how-can-i-get-the-image-sensor-dimensions-in-mm-to-get-circle-of-confusion-from
 
    Finding the Sensor Height:
        - [ Resolution in pixes / Focal Plane resolution (in DPI) ] /
 
*/

class ImageData : ObservableObject {
    
    @Published public var image: Image!
    @Published public var location: CLLocation!
    @Published public var imgMetaData: NSDictionary?
    @Published public var hasImage: Bool
    
    init() {
        self.image = Image("camera_placeholder")
        self.location = CLLocation()
        self.imgMetaData = nil
        self.hasImage = false
    }
    
    init(image: Image, location: CLLocation, focalLength: Double, imgMetaData: NSDictionary) {
        self.image       = image
        self.location    = location
        self.imgMetaData = imgMetaData
        self.hasImage    = true
    }
    
    // Function that returns the focal length of the camera used to take
    // the image
    public func focalLength() -> Double {
        var focLen: Double = 0
        
        let tempData = self.imgMetaData
        
        if(tempData != nil) {
            let exifData = tempData!["{Exif}"] as? NSDictionary
            focLen = (exifData?["FocalLength"] as! Double)
        }
        
        return focLen
    }
    
    public func magnification() -> Double {
        var magnification: Double = 1 // Default Zoom of the camera
        
        let tempData = self.imgMetaData
        
        // Check of tempData exists (when user captures an image)
        if(tempData != nil) {
            let exifData = tempData!["{Exif}"] as? NSDictionary
            
            // This check if the camera was zoomed in when the picture
            // was taken.
            if(exifData?["DigitalZoomRatio"] != nil) {
                magnification = (exifData?["DigitalZoomRatio"] as! Double)
            }
        }
        
        return magnification
    }
    
    public func imagePixelHeight() -> Double {
        
        let tempData = self.imgMetaData
        var imageHeight: Double = 0
        if(tempData != nil) {
            let exifData = tempData!["{Exif}"] as? NSDictionary
            
            if(exifData?["PixelYDimension"] != nil) {
                imageHeight = (exifData?["PixelYDimension"] as! Double)
            }
        }
        
        return (imageHeight)
    }
    
    public func sensorHeight(focalLength: Double) -> Double {
        var sensorHeight: Double = 0
        return sensorHeight
    }
}


struct ImageData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
