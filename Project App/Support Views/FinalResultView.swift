//
//  FinalResultView.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/14/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit


struct FinalResultView: View {
    var poiLoc : CLLocation
    
    
    func latitude() -> Double {
        return poiLoc.coordinate.latitude
    }
    
    func longitude() -> Double {
        return poiLoc.coordinate.longitude
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            MapView(latitude: latitude(), longitude: longitude())
                .frame(height: 500)
            
            Text("Estimated Location of Point of Interest")
                .font(.title)
            
            HStack(alignment: .bottom, spacing: 100.0) {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Longitude: \(longitude())")
                        
                    Text("Latitude: \(latitude())")
                }
            }.padding(20)
        }
        .offset(y: -130)
    }
}

struct FinalResultView_Previews: PreviewProvider {
    static var previews: some View {
        FinalResultView(poiLoc: CLLocation())
    }
}
