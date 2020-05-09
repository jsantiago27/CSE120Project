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
    var isReady: Bool
    
    func latitude() -> Double {
        return poiLoc.coordinate.latitude
    }
    
    func longitude() -> Double {
        return poiLoc.coordinate.longitude
    }
    
    var body: some View {
        ZStack {
            if(isReady) {
                VStack(alignment: .center, spacing: 10.0) {
                    MapView(latitude: latitude(), longitude: longitude())
                        .frame(height: 500)
                    
                    Text("Estimated Location of \nPoint of Interest")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    HStack(alignment: .center, spacing: 100.0) {
                        VStack(alignment: .leading, spacing: 20.0) {
                            Text("Longitude \n \(longitude())")
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                
                            Text("Latitude \n \(latitude())")
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                        }
                    }
                    .padding(20)
                }
                .offset(y: -130)
            }
            else {
                VStack(alignment: .center, spacing: 10.0) {
                    Text("Input Incomplete!")
                        .font(.headline)
                    
                    Text("Make sure every box is filled with pictures")
                        .font(.subheadline)
                }
            }
        }
    }
}

struct FinalResultView_Previews: PreviewProvider {
    static var previews: some View {
        FinalResultView(poiLoc: CLLocation(), isReady: false)
    }
}
