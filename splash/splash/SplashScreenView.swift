//
//  SplashScreenView.swift
//  splash
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive:Bool = false
    @State private var size=0.7
    @State private var opacity=0.4
    
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else{
            VStack(){
                Image("mascot")
                Text("LearnCodeOnline").font(.system(size:40)).bold().foregroundStyle(.black).opacity(0.7).padding()
            }.scaleEffect(size)
                .opacity(opacity)
                .onAppear(perform: {
                    withAnimation(.easeIn(duration:1.0 )) {
                        self.size = 1.2
                        self.opacity = 1.0
                    }
                  
                }).onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline:
                            .now()+1.5){
                                withAnimation{
                                    self.isActive = true
                                }
                            }
                })

        }
    }
}

#Preview {
    SplashScreenView()
}
