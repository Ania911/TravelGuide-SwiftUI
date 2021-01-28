//
//  GuideView.swift
//  TravelGuide
//
//  Created by a.sakiv on 26.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import SwiftUI

struct GuideView: View {
    let location: [Place]
    
    @State private var selectedImage: String = ""
    @State private var selectedName: String = ""
    @State private var selectedText: String = ""
    @State private var selectedUrl: String = ""
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        List(location) { places in
            HStack {
                Image(places.icon)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                VStack (alignment: .leading, spacing: 7) {
                    Text(places.name)
                        .fontWeight(.bold)
                    //                    Text(places.snippet)
                    
                }
                .padding(.leading, 10)
                Spacer(minLength: 0)
                
                
            }
            .onTapGesture {
                self.showModal.toggle()
                self.selectedImage = places.icon
                self.selectedName = places.name
                self.selectedText = places.snippet
                self.selectedUrl = places.openUrl
                
                print("Welcome")
            }
            .background(Color.white.shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 4))
            .cornerRadius(15)
            
        }.sheet(isPresented: $showModal) {
            
            
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
            
            HStack {
                Button(action: {
                    print("star action")
                }) {
                    
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                }.buttonStyle(BorderlessButtonStyle())
                
                Spacer().frame(width: 25, height: 36.0, alignment: .topLeading)
                
                Button(action: {
                    print("location action")
                }) {
                    Image(systemName: "location")
                        
                        .resizable()
                        .frame(width: 15, height: 15)
                    
                }.buttonStyle(BorderlessButtonStyle())
            }
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


