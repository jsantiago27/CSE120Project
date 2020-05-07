//
//  MapView.swift
//  Project App
//
//  Created by Jefferson Santiago on 4/14/20.
//  Copyright © 2020 Jefferson Santiago. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var latitude: Double?
    var longitude: Double?
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        //let coordinate = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
        //let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        //let region = MKCoordinateRegion(center: coordinate, span: span)
        //uiView.setRegion(region, animated: true)
        
        
        
        // 1
        view.mapType = MKMapType.standard // (satellite)

        // 2
        let mylocation = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)

        // 3
        let coordinate = CLLocationCoordinate2D(
            latitude: latitude ?? 0, longitude: longitude ?? 0)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        // 4
        let annotation = MKPointAnnotation()
        annotation.coordinate = mylocation

        annotation.title = "Point of Interest Location"
        annotation.subtitle = "This is an estimation of the point of interest"
        view.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 0.0, longitude: 0.0)
    }
}
