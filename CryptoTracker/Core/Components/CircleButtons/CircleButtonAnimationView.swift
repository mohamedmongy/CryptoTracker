//
//  CircleButtonAnimationView.swift
//  CryptoTracker
//
//  Created by mongy on 14/02/2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding<Bool> var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(false))
            .frame(width: 50, height: 50)
    }
}
