//
//  ContentView.swift
//  TravelGuide
//
//  Created by a.sakiv on 29.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import SwiftUI

struct ShowModal: View {
    @Binding var showSheetView: Bool
    //   The View for sheet toggle
    var body: some View {
        VStack(alignment: .leading){
        NavigationView {
            Text("")
                .frame(width: 1, height: 1, alignment: .leading)
                .navigationBarTitle(Text("Travel Guide"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    print("Dismissing sheet view...")
                    self.showSheetView = false
                    
                }) {
                    Text("Done").bold()
                })
      
        }
        }
    }
    
}

