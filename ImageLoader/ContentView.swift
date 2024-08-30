//
//  ContentView.swift
//  ImageLoader
//
//  Created by Taras Prystupa on 30.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var getNextRecordsFromCache = 10
    @State private var products: [Product] = []
    @State private var api = Api()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            Text("Products")
                .font(.system(size: 24, weight: .bold, design: .default))
            
            SearchBar(searhText: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            
            List(products.indices.filter { index in
                let product = products[index]
                
                if searchText.isEmpty {
                    return true
                } else {
                    return product.title.localizedCaseInsensitiveContains(searchText)
                }
            }, id: \.self) { index in
                if index < getNextRecordsFromCache {
                    let product = products[index]
                    AsyncImage(url: product.thumbnail, title: product.title)
                        .onAppear {
                            if index == getNextRecordsFromCache - 1 {
                                getNextRecordsFromCache += 10
                            }
                        }
                }
            }
            .onAppear(perform: {
                Task {
                    do {
                        let productResponce: ProductResponce = try await api.fetchProduct()
                        products = productResponce.products
                    } catch {
                        print(error)
                    }
                }
                
            })
        }
    }
}
