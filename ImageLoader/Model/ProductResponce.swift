//
//  ProductResponce.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import Foundation


struct Product : Codable, Identifiable {
    
    let id: Int
    let title: String
    let thumbnail: String
}


struct ProductResponce: Codable {
    let products: [Product]
}
