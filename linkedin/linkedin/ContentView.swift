//
//  ContentView.swift
//  linkedin
//
//  Created by ACC3611701 on 18/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(){
            HomeScreenView().tabItem {  Image(systemName: "house.fill")
                Text("Home") }
            MyNetworkScreenView().tabItem {  Image(systemName: "person.2.fill")
                Text("MyNetwork") }
            Text("Post")
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Post")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell.badge.fill")
                    Text("Notifications")
                }
            Text("Jobs")
                .tabItem {
                    Image(systemName: "briefcase.fill")
                    Text("Jobs")
                }
        }
    }
}

#Preview {
    ContentView()
}
