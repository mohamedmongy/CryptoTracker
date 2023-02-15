//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by mongy on 13/02/2023.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(homeViewModel)
        }
    }
}
