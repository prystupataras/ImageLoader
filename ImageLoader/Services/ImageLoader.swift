//
//  ImageLoader.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private let cache = ImageCache.shared
    
    func loadImage(from url: String) {
        if let cachedImage = cache.getImage(forKey: url) {
            image = cachedImage
            return
        }
        
        guard let imageUrl = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { data, responce, error in
            guard let data = data, let loadImage = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.cache.setImage(loadImage, forKey: url)
                self.image = loadImage
            }
        }.resume()
        
    }
}

