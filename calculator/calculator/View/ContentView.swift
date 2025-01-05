//
//  ContentView.swift
//  calculator
//
//  Created by ACC3611701 on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(){
            LinearGradient( gradient: Gradient(colors: [.pink.opacity(0.3),.purple.opacity(0.5)]),startPoint: .top,endPoint: .bottom).ignoresSafeArea()
            KeyView()
        }
        
    }
}

#Preview {
    ContentView()
}
