//
//  HomeScreenView.swift
//  shopping
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {

            VStack(alignment:.leading,spacing: 10){
                HStack(content: {
                    Image(systemName: "line.3.horizontal")
                    Spacer()
                    Image(systemName: "cart.badge.plus")
                }).font(.title3)
                Text("Hey,").font(.largeTitle).bold()
                Text("Find fresh fruits that you want")
                RoundedRectangle(cornerRadius: 10.0).fill(.gray.opacity(0.15)).overlay(content: {
                    HStack(alignment:.center,content: {
                        Image(systemName: "magnifyingglass")
                        Text("Search fresh fruits").foregroundStyle(.gray)
                        Spacer()
                    }).padding(.horizontal)
                }).frame(width: .infinity,height: 50)
                
                TopSellingView()
                NearYouView()
            }.padding()
        }
       
        
    
}

#Preview {
    HomeScreenView()
}
