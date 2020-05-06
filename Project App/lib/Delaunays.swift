//
//  Delaunays.swift
//  Project App
//
//  Created by Ricky Trujillo on 4/21/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import Foundation
import CoreLocation

// Main Class
class Delaunays {
    var mainImage: ImageData
    var leftImage: ImageData
    var rightImage: ImageData
    var mag_left: Double
    var mag_main: Double
    var mag_right: Double
    var focA=0
    var locationA=0
    var focB=0
    var locationB=0
    var focC=0
    var locationC=0
    var oheight_right: Double
    var oheight_main = Double
    var oheight_left = Double
    
    
    init(mainImage: ImageData, leftImage: ImageData, rightImage: ImageData) {
        self.mainImage = mainImage
        self.leftImage = leftImage
        self.rightImage = rightImage
    }
    
}

// Helper Functions
extension Delaunays {
    
    // Returns the midpoint between two locations
    func findMidpoint(locA: CLLocation, locB: CLLocation) -> CLLocation {
        let midLatitude     = locA.coordinate.latitude + ( abs(locA.coordinate.latitude - locB.coordinate.latitude) / 2 )
        let midLongitude    = locA.coordinate.longitude + ( abs(locA.coordinate.longitude - locB.coordinate.longitude) / 2 )
        
        return CLLocation(latitude: midLatitude, longitude: midLongitude)
    }
    
}

// Calculation
extension Delaunays {
    
    func findPinpoint() -> CLLocation {
        //A - focal length w/ GPS coordinates
        var focA = mainImage.focalLength()
        var locationA = mainImage.location
        //B - focal length w/ GPS coordinates
        var focB = rightImage.focalLength()
        var locationB = rightImage.location
        //C -focal length w/ GPS coordinates
        var focC = leftImage.focalLength()
        var locationC = leftImage.location
 
        mag_right = rightImage.magnification()
        mag_main = mainImage.magnification()
        mag_left = leftImage.magnification()
        
        let exifData1 = rightImage.imgMetaData!["{Image Height}"] as Double
        let exifData2 = mainImage.imgMetaData!["{Image Height}"] as Double
        let exifData3 = leftImage.imgMetaData!["{Image Height}"] as Double
        
        oheight_right = exifData1/mag_right
        oheight_main = exifData2/mag_main
        oheight_left = exifData3/mag_left
        
        var fB_theta1 = atan(exifData1/focB)
        var fB_theta2 = 180-fB_theta1
        var B_olength = oheight_right/tan(fB_theta2)
        
        var fC_theta1 = atan(exifData3/focC)
        var fC_theta2 = 180-fC_theta1
        var C_olength = oheight_left/tan(fC_theta2)
        
        //getting coordinates of midpoint (adding longitude  and latitude)
        var mid_AB = findMidpoint(locA: locationA, locB: locationB) + locationA
        var mid_CA = findMidpoint(locA: locationC, locB: locationA) + locationC
        
        var alpha_B = acos(mid_AB/B_olength)
        var alpha_C = acos(mid_CA/C_olength)
        var midAB_length = B_olength * sin(alpha_B)
        var midCA_length = C_olength * sin(alpha_C)
        
        //is this the length
        var alpha_AB = atan(midAB_length/mid_AB)
        var alpha_CA = atan(midCA_length/mid_CA)
        
        var alpha_1A = 180 - 90 - alpha_AB
        var alpha1A_inv = 90 - alpha_1A
        
        var A1_length = mid_AB * cos(alpha_AB)
        var A2_length = midAB_length * sin(alpha1A_inv)
        
        var A_totalLength = A1_length + A2_length
        
        var object_distance = locationA + A_totalLength
        
        
        return CLLocation()
    }
    
}


