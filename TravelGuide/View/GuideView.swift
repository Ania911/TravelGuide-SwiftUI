//
//  GuideView.swift
//  TravelGuide
//
//  Created by a.sakiv on 26.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import SwiftUI

struct GuideView: View {
//    To get all data from Place
    let location: [Place]
    @State private var showDetails = false
    @State private var selectedImage: String = ""
    @State private var selectedName: String = ""
    @State private var selectedText: String = ""
    @State private var selectedUrl: String = ""
    @State private var showSheetView: Bool = false
    
//    Guide View
    var body: some View {
        GeometryReader { proxy in
            List(self.location) { places in
                HStack {
                    Image(places.icon)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                    VStack (alignment: .leading, spacing: 7) {
                        Text(places.name)
                            .fontWeight(.bold)
                        //  Text(places.snippet)
                        
                    }
                    .padding(.leading, 10)
                    Spacer(minLength: 0)
                    
//     When click on the plases...
                }
                .onTapGesture {
                    self.showSheetView.toggle()
                    self.selectedImage = places.icon
                    self.selectedName = places.name
                    self.selectedText = places.snippet
                    self.selectedUrl = places.openUrl
                    
                }
                .background(Color.white.shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 4))
                .cornerRadius(5)
//           Sheet UI
            }.sheet(isPresented: self.$showSheetView) {
                
                VStack (alignment: .center) {
                    
                    ShowModal(showSheetView: self.$showSheetView)
             
                    Image(self.selectedImage)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(50)
                    Text(self.selectedName)
                        .fontWeight(.bold)
                        .padding(5)
                    Text(self.selectedText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                    
//                    See more flows - go to URL Safari
                    Button(action: {
                        guard let google = URL(string: self.selectedUrl),
                            UIApplication.shared.canOpenURL(google) else {
                                return
                        }
                        UIApplication.shared.open(google,
                                                  options: [:],
                                                  completionHandler: nil)
                    }) {
                        Text("see more")
                        Text("See More")
                            .frame(width: 15, height: 15)
                            .font(.footnote)
                        
                    }.buttonStyle(BorderlessButtonStyle())
                    
                    Spacer().frame(width: 15, height: 25.0, alignment: .topLeading)
//                   Like the place
                    HStack {
                        Button(action: {
                            self.showDetails.toggle()
                            print("star action")
                        }) {
                            
                            Text("LIKE")
                        }
                        
                        if self.showDetails {
                            Image(systemName: "star.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                        }
                        
                    }.buttonStyle(BorderlessButtonStyle())
                    Spacer().frame(width:15, height: 25.0, alignment: .topLeading)
                    
                }
                .padding(.bottom, proxy.safeAreaInsets.top)
            }
                
            .edgesIgnoringSafeArea(.bottom)
            
        }
    }
}


struct quideView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuideView(location: places)
        }
        
    }
}


