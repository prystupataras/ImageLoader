//
//  AsyncImage.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import SwiftUI

struct AsyncImage: View {
    
    @StateObject private var imageLoader = ImageLoader()
    
    let url: String
    let title: String
    
    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                Text(title)
                    .font(.headline)
                    .padding(.top, 8)
            } else {
                ProgressView()
            }
        }
        .onAppear() {
            imageLoader.loadImage(from: url)
        }
    }
}
