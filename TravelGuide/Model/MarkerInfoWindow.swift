//
//  markerInfoWindow.swift
//  TravelGuide
//
//  Created by a.sakiv on 20.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//
import Foundation
import Combine
import CoreLocation
import GoogleMaps

class MarkerInfoWindow: NSObject, ObservableObject {
    var place = PlaceMarker()
  
}
extension MarkerInfoWindow: GMSMapViewDelegate{
    /* handles Info Window tap */
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf")
    }
    
    /* handles Info Window long press */
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }

    /* set a custom Info Window */
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let label1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        label1.text = "Text"
        view.addSubview(label1)

        return view
    }
    
    
}
