//
//  FinalResultView.swift
//  Project App
//
//  Created by team T͟Hē Lōkātərs on 4/14/20.
//  Copyright © 2020 T͟Hē Lōkātərs. All rights reserved.
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
                    
                    VStack(alignment: .center, spacing: 10.0) {
                        Text("Point of interest Coordinates")
                            .font(.title)
                        
                        HStack(alignment: .top, spacing: 20.0) {
                            Text("Longitude: \(longitude())")
                                .multilineTextAlignment(.center)
                                .lineLimit(2)
                                
                            Text("Latitude: \(latitude())")
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
        .navigationBarTitle(Text("Estimated Location of Point of Interest"), displayMode: .inline)
    }
}

struct FinalResultView_Previews: PreviewProvider {
    static var previews: some View {
        FinalResultView(poiLoc: CLLocation(), isReady: true)
    }
}
