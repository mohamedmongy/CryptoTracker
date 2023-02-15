//
//  ContentView.swift
//  CryptoTracker
//
//  Created by mongy on 13/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.green
//                .ignoresSafeArea()
            Color.theme.background
                .ignoresSafeArea()
            
        
            VStack(spacing: 20) {
                Text("accent color")
                    .foregroundColor(Color.theme.accentColor)
                Text("secondary color")
                    .foregroundColor(Color.theme.secondaryColor)
                Text("red color")
                    .foregroundColor(Color.theme.red)
                Text("green color")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
