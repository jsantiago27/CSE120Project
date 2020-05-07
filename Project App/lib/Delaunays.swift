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
// Variables and init
class Delaunays {
    var mainImage: ImageData
    var leftImage: ImageData
    var rightImage: ImageData
    
    var mag_left: Double = 0
    var mag_main: Double = 0
    var mag_right: Double = 0
    
    var focA: Double = 0
    var focB: Double = 0
    var focC: Double = 0
    
    var locationA: CLLocation
    var locationB: CLLocation
    var locationC: CLLocation
    
    
    var oheight_right: Double = 0
    var oheight_main: Double = 0
    var oheight_left: Double = 0
    
    
    init(mainImage: ImageData, leftImage: ImageData, rightImage: ImageData) {
        self.mainImage = mainImage
        self.leftImage = leftImage
        self.rightImage = rightImage
        
    
        locationA = self.mainImage.location
        locationB = self.leftImage.location
        locationC = self.rightImage.location
    }
    
}

// Helper Functions
extension Delaunays {
    
    // Returns the midpoint between two locations
    func findMidpoint(locA: CLLocation!, locB: CLLocation!) -> CLLocation {
        let midLatitude     = locA.coordinate.latitude + ( abs(locA.coordinate.latitude - locB.coordinate.latitude) / 2 )
        let midLongitude    = locA.coordinate.longitude + ( abs(locA.coordinate.longitude - locB.coordinate.longitude) / 2 )
        
        return CLLocation(latitude: midLatitude, longitude: midLongitude)
    }
    
    func findObjectHeight(magnification: Double, imageHeight: Double) -> Double {
        return imageHeight / magnification
    }
    
    
    func findTanAngleFromTwoPoints(locA: CLLocation!, locB: CLLocation!) -> Double {
        var angle: Double = 0
        angle = atan( (locB.coordinate.longitude - locA.coordinate.longitude) / (locB.coordinate.latitude - locA.coordinate.latitude) )
        return angle
    }
    
    func findTanAngleFromTwoPoints(oppositeLine: Double, adjacentLine: Double) -> Double {
        return atan(oppositeLine/adjacentLine)
    }
    
    func findDistFromTwoPoints(locA: CLLocation!, locB: CLLocation!) -> Double {
        var distBWPoints: Double = 0
        distBWPoints = sqrt(pow(locB.coordinate.latitude - locA.coordinate.latitude, 2) + pow(locB.coordinate.longitude - locA.coordinate.longitude, 2))
        
        return distBWPoints
    }
    
    func findCosAngleFromTwoPoints(adjacentLine: Double, hypothenusLine: Double) -> Double {
        return acos(adjacentLine/hypothenusLine)
    }
    
    func objectDistance(focalLength: Double, imageHeight: Double, objectHeight: Double, sensorHeight: Double) -> Double {
        return ((focalLength * 70.556 * imageHeight) / (200.0 * 5.79))
    }
    
}

// Calculation
extension Delaunays {
    
    func findPinpoint() -> CLLocation {
        //A - focal length w/ GPS coordinates
        let focA = mainImage.focalLength()
        let locationA = mainImage.location
        //B - focal length w/ GPS coordinates
        let focB = rightImage.focalLength()
        let locationB = rightImage.location
        //C -focal length w/ GPS coordinates
        let focC = leftImage.focalLength()
        let locationC = leftImage.location
 
        mag_right = rightImage.magnification()
        mag_main = mainImage.magnification()
        mag_left = leftImage.magnification()
        
        let exifData1 = (rightImage.imgMetaData!["{ImageHeight}"] as? Double ?? 0)
        let exifData2 = (mainImage.imgMetaData!["{ImageHeight}"] as? Double ?? 0)
        let exifData3 = (leftImage.imgMetaData!["{ImageHeight}"] as? Double ?? 0)
        
        oheight_right = exifData1 / mag_right
        oheight_main = exifData2 / mag_main
        oheight_left = exifData3 / mag_left
        
        var fB_theta1: Double = atan(exifData1/focB)
        var fB_theta2: Double = 180 - fB_theta1
        var B_olength = oheight_right/tan(fB_theta2)
        
        var fC_theta1: Double = atan(exifData3/focC)
        var fC_theta2: Double = 180 - fC_theta1
        var C_olength: Double = oheight_left/tan(fC_theta2)
        
        //getting coordinates of midpoint (adding longitude  and latitude)
        var mid_AB = findMidpoint(locA: locationA, locB: locationB)
        var mid_CA = findMidpoint(locA: locationC, locB: locationA)
        
        var alpha_B: Double = acos(mid_AB/B_olength)
        var alpha_C: Double = acos(mid_CA/C_olength)
        
        var midAB_length: Double = B_olength * sin(alpha_B)
        var midCA_length: Double = C_olength * sin(alpha_C)
        
        //is this the length
        var alpha_AB: Double = atan(midAB_length/mid_AB) // mid_AB
        var alpha_CA: Double = atan(midCA_length/mid_CA) // mid_CA
        
        var alpha_1A: Double = 180 - 90 - alpha_AB
        var alpha1A_inv: Double = 90 - alpha_1A
        
        var A1_length: Double = mid_AB * cos(alpha_AB) // mid_AB
        var A2_length: Double = midAB_length * sin(alpha1A_inv)
        
        var A_totalLength: Double = A1_length + A2_length
        
        var object_distance: Double = locationA + A_totalLength //
        
        
        return CLLocation()
    }
    
}


