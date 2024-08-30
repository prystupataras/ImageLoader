//
//  Api.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import Foundation

class Api {
    func fetchProduct<T: Codable>() async throws -> T {
        do {
            let url = URL(string: "https://dummyjson.com/products?limit=0")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            
            let response = try decoder.decode(T.self, from: data)
            
            return response
        } catch {
            throw error
        }
    }
}
