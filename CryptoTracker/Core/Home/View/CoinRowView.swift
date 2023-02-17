//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by mongy on 14/02/2023.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack {
            leftColumn
            Spacer()
            holdingColumn
            rightColumn
        }
        .font(.subheadline)
    }
}


extension CoinRowView {
    var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryColor)
                .frame(width: 30)
            CoinImageView(urlString: coin.image, coinId: coin.id)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accentColor)
        }
    }
    
    var holdingColumn: some View {
        VStack {
            if showHoldingsColumn {
                VStack {
                    Text(coin.currentHoldingsValue.asCurrencyWith2Decimals() )
                        .bold()
                    Text(coin.currentHoldings?.asNumberString() ?? "0")
                }
            }
        }
    }
    
    var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith2Decimals() )
                .bold()
                .foregroundColor(Color.theme.accentColor)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
