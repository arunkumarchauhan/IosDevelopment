//
//  SplashScreenView.swift
//  shopping
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        NavigationView(content: {
            VStack(spacing:20){
          
                Spacer(minLength: 80)
                Image("img").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: .infinity,height: 300)
                VStack(alignment: .leading,spacing: 10){
                    Text("Order Your Favourite Fruits").font(.system(size: 35)).bold().foregroundStyle(.black)
                    Text("Eat fresh fruit and try to be healthy").font(.system(size: 20)).foregroundStyle(.black.opacity(0.7))
                    Spacer()
                    NavigationLink(destination: HomeScreenView()) {
                        RoundedRectangle(cornerRadius: 12).fill(Color("6")).frame(width: .infinity,height: 60).overlay(alignment: .center) {
                            HStack(spacing: 10){
                                Text("Next")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Image(systemName: "chevron.right")
                            }.foregroundColor(.black)
                        }
                    }
                    
                }
            }
            .padding(CGFloat(20))
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        })
    }
}

#Preview {
    SplashScreenView()
}
