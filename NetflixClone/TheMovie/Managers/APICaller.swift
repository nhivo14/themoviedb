//
//  APICaller.swift
//  TheMovie
//
//  Created by NhiVHY on 30/01/2024.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func getAllTrending() {
        NetworkManager.shared.get(endpoint: Endpoints.getAllTrending) { (result: Result<TrendingMoviesResponse, Error>) in
            
            switch result {
            case .success(let response):
                // Handle successful response
                print(response.result)
            case .failure(let error):
                // Handle error
                print("Error deleting data: \(error.localizedDescription)")
            }
        }
    }
}
