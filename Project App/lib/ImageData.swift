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
import Combine

class ImageData : ObservableObject {
    
    @Published var image: Image!
    @Published var location: CLLocation!
    @Published var focalLength: Double?
    @Published var magnification: Double?
    
    init() {
        self.image = Image("Garfield")
        self.location = CLLocation()
        self.focalLength = 0.0
        self.magnification = 0.0
    }
    
    init(image: Image, location: CLLocation, focalLength: Double, magnification: Double) {
        self.image       = image
        self.location    = location
        self.focalLength = focalLength
        self.magnification = magnification
    }
}

