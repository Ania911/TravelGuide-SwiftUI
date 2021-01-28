//
//  HomeView.swift
//  TravelGuide
//
//  Created by a.sakiv on 26.01.2021.
//  Copyright © 2021 a.sakiv. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    
    var body: some View{
            GeometryReader { mainView in
                ScrollView {
                    VStack(spacing: 15){
                        
                        ForEach(places) { thisItem in
                            // Item View
                            GeometryReader { item in
                                GuideView(location: places)
                                  
                                    .scaleEffect(self.scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY),anchor: .bottom)
                                    
                                    .opacity(Double(self.scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                            }
                            
                            .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top,25)
                }
               
                .zIndex(1)
            }
        
//        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
//        .edgesIgnoringSafeArea(.top)
        }

    }


extension HomeView {
 
    func scaleValue(mainFrame : CGFloat, minY : CGFloat)-> CGFloat {
        withAnimation(.easeOut) {
            let scale = (minY - 25) / mainFrame
            if scale > 1 {
                return 1
            }
            else {
                return scale
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
