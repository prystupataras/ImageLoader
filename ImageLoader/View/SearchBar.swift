//
//  SearchBar.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searhText: String
    
    var body: some View {
        TextField("Product Search", text: $searhText)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(.gray.opacity(0.2))
            .cornerRadius(8)
            .overlay (
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                        .padding(.leading, 8)
                    Spacer()
                    
                    if !searhText.isEmpty {
                        Button(action: {
                            searhText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.gray)
                                .padding(.trailing, 8)
                        }.padding(.horizontal)
                    }
                }
            )
        
        
    }
}

