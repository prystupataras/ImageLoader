//
//  ImageCache.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import SwiftUI

class ImageCache {
    
    static let shared = ImageCache()
    
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {
        cache.totalCostLimit = 100
    }
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}
