//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by ACC3611701 on 06/08/24.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var listViewModel = ListViewModel(items: [])
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(listViewModel)
        }
    }
}
