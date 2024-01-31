//
//  APIService.swift
//  TheMovie
//
//  Created by NhiVHY on 31/01/2024.
//

import Foundation

enum APIError {
    case failedToGetData
}

class APIService {
     
    static let shared = APIService()
    private let networkManager = NetworkManager()
    
//    MARK: - Trending
    func getAllTrending(completion: @escaping (Result<TrendingMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getAllTrending, completion: completion)
    }
}
