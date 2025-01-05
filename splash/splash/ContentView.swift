//
//  ContentView.swift
//  splash
//
//  Created by ACC3611701 on 15/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var size=0
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Home Screen of LCO App").font(.system(size: 30)).bold().padding().foregroundStyle(.white)
          
        }
    }
}

#Preview {
    ContentView()
}
