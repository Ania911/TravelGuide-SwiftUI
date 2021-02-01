//
//  TabBarButton.swift
//  TravelGuide
//
//  Created by a.sakiv on 30.12.2020.
//  Copyright © 2020 a.sakiv. All rights reserved.
//
import Combine
import CoreLocation
import SwiftUI
import GooglePlaces

struct TabBarButton: View {
    
    @State private var selectedItem = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack (alignment:.center) {
                TabView (selection: self.$selectedItem) {
                    
                    // The first  tab bar icon
                    MapView().tabItem {
                        Image(systemName: "map.fill")
                        Text("Map")
                    
                    }.tag(0)
               
                    // The 2 tab bar icon
                    GuideView(location: places).tabItem {
                        
                        Image(systemName: "tornado")
                        Text("Guide")
                    }.tag(1)
                    
                    // The 3 tab bar icon
                    Text("The content will be available soon")
                        .animation(.easeInOut)
                   .tabItem {
                        
                            Image(systemName: "star")
                            Text("Bookmark")
                    } .tag(2)
                }
            }
                
            .padding(.bottom, geometry.safeAreaInsets.bottom)
            .padding(.top, geometry.safeAreaInsets.top)
   
        }
//            For save area UI
        .edgesIgnoringSafeArea(.all)
    }
    
    struct TabBarButton_Previews: PreviewProvider {
        static var previews: some View {
            TabBarButton()
        }
    }
}
