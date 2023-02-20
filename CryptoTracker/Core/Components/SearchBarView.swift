//
//  SearchBarView.swift
//  CryptoTracker
//
//  Created by mongy on 20/02/2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchQuery: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchQuery.isEmpty ? Color.theme.secondaryColor :  Color.theme.accentColor
                )
        
            TextField("type search query here", text: $searchQuery)
                .foregroundColor(Color.theme.accentColor)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10, y: 0)
                        .foregroundColor(Color.theme.accentColor)
                        .opacity(
                            searchQuery.isEmpty ? 0.0 : 1.0
                        )
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchQuery = ""
                        }
                }
               
                
        }
        .font(.headline)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accentColor.opacity(0.45), radius: 10)
        }
        .padding()
    }

}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchQuery: .constant(""))
                .previewLayout(.sizeThatFits)
            SearchBarView(searchQuery: .constant(""))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)

        }
    }
}
