//
//  LocationManager.swift
//  TravelGuide
//
//  Created by a.sakiv on 01.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//
import Foundation
import Combine
import CoreLocation
import GoogleMaps


class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    // location variable that will track the current user’s location.
     @Published var location: CLLocation?
    
      override init() {
       super.init()

       locationManager.delegate = self
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
       locationManager.distanceFilter = kCLDistanceFilterNone
       locationManager.requestWhenInUseAuthorization()
       locationManager.startUpdatingLocation()
     }
    
    // two helper variables that will help us track the current latitude and longitude.
    var latitude: CLLocationDegrees {
        return location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees {
        return location?.coordinate.longitude ?? 0
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
  // start receiving location updates if the user approved location tracking.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.location = location
        }    
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("location manager authorization status changed")
        
        switch status {
        case .authorizedAlways:
            print("user allow app to get location data when app is active or in background")
        case .authorizedWhenInUse:
            print("user allow app to get location data only when app is active")
        case .denied:
            print("user tap 'disallow' on the permission dialog, cant get location data")
        case .restricted:
            print("parental control setting disallow location data")
        case .notDetermined:
            print("the location permission dialog haven't shown before, user haven't tap allow/disallow")
        @unknown default:
            print("FATAl ERROR")
        }
    }
}


