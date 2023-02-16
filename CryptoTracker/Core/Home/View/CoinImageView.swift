//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by mongy on 16/02/2023.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(urlString: String) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(urlString: urlString))
    }
    
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isloading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryColor)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(urlString: dev.coin.image)
    }
}
