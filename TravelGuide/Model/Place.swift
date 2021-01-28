//
//  PlaceMarker.swift
//  TravelGuide
//
//  Created by a.sakiv on 15.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps
  
    struct Place: Identifiable {
        var id = UUID()
        var name: String
        var latitude = Double()
        var longitude = Double()
        var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        var snippet: String
        var icon: String
        var openUrl: String!
        
    }
    
    
let places: [Place] = [
    Place (name: "",latitude: , longitude: , snippet: "  ", icon: "", openUrl: ""),
 
]

    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    
    
    

