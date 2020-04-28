//
//  ImageData.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/22/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI

class ImageData {
    
    var image: Image!
    var location: CLLocation!
    var focalLength: Double
    
    init() {
        self.image = Image("Garfield")
        self.location = CLLocation()
        self.focalLength = 0.0
    }
    
    init(image: Image, location: CLLocation, focalLength: Double) {
        self.image       = image
        self.location    = location
        self.focalLength = focalLength
    }
}
