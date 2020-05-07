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
    
    
    var location: Delaunays

    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            MapView(latitude: location.findPinpoint().coordinate.latitude, longitude: location.findPinpoint().coordinate.longitude)
                .frame(height: 500)
            
            Text("Point of Interest Location")
                .font(.title)
            
            HStack(alignment: .bottom, spacing: 100.0) {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Longitude")
                        
                    Text("Latitude")
                }
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Longitude")
                        
                    Text("Latitude")
                }
            }.padding(20)
        }
        .offset(y: -130)
    }
}

struct FinalResultView_Previews: PreviewProvider {
    static var previews: some View {
        FinalResultView(location: Delaunays())
    }
}
