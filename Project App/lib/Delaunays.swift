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
    
    
    var odistance_right: Double = 0
    var odistance_main: Double = 0
    var odistance_left: Double = 0
    
    
    init() {
        self.mainImage = ImageData()
        self.leftImage = ImageData()
        self.rightImage = ImageData()
        
        locationA = self.mainImage.location
        locationB = self.leftImage.location
        locationC = self.rightImage.location
    }
    
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
    private func findMidpoint(locA: CLLocation!, locB: CLLocation!) -> CLLocation {
        let midLatitude     = locA.coordinate.latitude + ( abs(locA.coordinate.latitude - locB.coordinate.latitude) / 2 )
        let midLongitude    = locA.coordinate.longitude + ( abs(locA.coordinate.longitude - locB.coordinate.longitude) / 2 )
        
        return CLLocation(latitude: midLatitude, longitude: midLongitude)
    }
    
    private func findObjectHeight(magnification: Double, imageHeight: Double) -> Double {
        return imageHeight / magnification
    }
    
    
    private func findTanAngleFromTwoPoints(locA: CLLocation!, locB: CLLocation!) -> Double {
        var angle: Double = 0
        angle = atan( (locB.coordinate.longitude - locA.coordinate.longitude) / (locB.coordinate.latitude - locA.coordinate.latitude) )
        return angle
    }
    
    private func findTanAngleFromTwoPoints(oppositeLine: Double, adjacentLine: Double) -> Double {
        return atan(oppositeLine/adjacentLine)
    }
    
    private func findDistFromTwoPoints(locA: CLLocation!, locB: CLLocation!) -> Double {
        var distBWPoints: Double = 0
        distBWPoints = sqrt(pow(locB.coordinate.latitude - locA.coordinate.latitude, 2) + pow(locB.coordinate.longitude - locA.coordinate.longitude, 2))
        
        return distBWPoints
    }
    
    private func findCosAngleFromTwoPoints(adjacentLine: Double, hypothenusLine: Double) -> Double {
        return acos(adjacentLine/hypothenusLine)
    }
    
    private func objectDistance(focalLength: Double, imageHeight: Double) -> Double {
        return ((focalLength * 70.556 * imageHeight) / (200.0 * 5.79))
    }
    
}

// Calculation
extension Delaunays {
    
    public func findPinpoint() -> CLLocation {
        //A - focal length w/ GPS coordinates
        //let focA = mainImage.focalLength()
        let locationA = mainImage.location
        //B - focal length w/ GPS coordinates
        let focB = rightImage.focalLength()
        let locationB = rightImage.location
        //C -focal length w/ GPS coordinates
        let focC = leftImage.focalLength()
        let locationC = leftImage.location
        
        let exifData1 = (rightImage.imgMetaData!["{ImageHeight}"] as? Double ?? 0)
        //let exifData2 = (mainImage.imgMetaData!["{ImageHeight}"] as? Double ?? 0)
        let exifData3 = (leftImage.imgMetaData!["{ImageHeight}"] as? Double ?? 0)
        
        odistance_right = objectDistance(focalLength: focB, imageHeight: exifData1)
        odistance_left = objectDistance(focalLength: focC, imageHeight: exifData3)
        
        let mid_ABpoint:CLLocation = findMidpoint(locA: locationA, locB: locationB)
        let mid_ACpoint:CLLocation = findMidpoint(locA: locationA, locB: locationC)
        
        let midAC_distance = findDistFromTwoPoints(locA: locationA, locB: mid_ACpoint)
        let midAB_distance = findDistFromTwoPoints(locA: locationA, locB: mid_ABpoint)
        
        let alpha_B: Double = findCosAngleFromTwoPoints(adjacentLine: midAB_distance, hypothenusLine: odistance_right)
        let alpha_C: Double = findCosAngleFromTwoPoints(adjacentLine: midAC_distance, hypothenusLine: odistance_left)
        
        let midAB_length:Double = midAB_distance * tan(alpha_B)
        let midAC_length:Double = midAC_distance * tan(alpha_C)
        
        let alpha_AB = findTanAngleFromTwoPoints(oppositeLine: midAB_length, adjacentLine: midAB_distance)
        let alpha_AC = findTanAngleFromTwoPoints(oppositeLine: midAC_length, adjacentLine: midAC_distance)
        
        let A_lengthB: Double  = midAB_length / (sin(alpha_AB))
        let A_lengthC: Double = midAC_length / (sin(alpha_AC))
        
        let A_lengthAvg: Double = (A_lengthB + A_lengthC) / 2
        
        let object_distanceFromPointA: CLLocation = CLLocation(latitude: (locationA?.coordinate.latitude ?? 0) + A_lengthAvg, longitude: locationA?.coordinate.longitude ?? 0)
        
        return object_distanceFromPointA
    }
    
}


