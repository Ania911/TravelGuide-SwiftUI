//
//  MapView.swift
//  TravelGuide
//
//  Created by a.sakiv on 29.12.2020.
//  Copyright © 2020 a.sakiv. All rights reserved.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import GooglePlaces

struct MapView: View {
    
    @State private var selection = 0
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    
    // for navigation bar title color
    init() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.gray]
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "AcademyEngravedLetPlain", size: 25)!]
        
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TabBarButton()
                    .navigationBarTitle("Travel Guide", displayMode: .inline)
                
            }
        }
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
        
    }
}

