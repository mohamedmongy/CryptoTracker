//
//  CircleButtonView.swift
//  CryptoTracker
//
//  Created by mongy on 14/02/2023.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .frame(width: 50, height: 50)
            .font(.headline)
            .foregroundColor(Color.theme.accentColor)
            .background {
                Circle()
                    .foregroundColor(Color.theme.background)
            }
            .shadow(color: Color.theme.accentColor.opacity(0.25),
                    radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
        }
        
    }
}
