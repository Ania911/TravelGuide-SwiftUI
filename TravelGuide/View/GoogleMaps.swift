//
//  GoogleMapsView.swift
//  TravelGuide
//
//  Created by a.sakiv on 05.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import SwiftUI
import CoreLocation
import GoogleMaps

struct GoogleMaps: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    var placeMarker = PlaceMarker()
    var markerInfoWindow = MarkerInfoWindow()
    private let zoom: Float = 17.0

    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        // Set the map style by passing the URL of the local file.
        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        //            Satellite
        mapView.mapType = .normal
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.tiltGestures = true
 
        return mapView
    }
    
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))

    
    }
}
