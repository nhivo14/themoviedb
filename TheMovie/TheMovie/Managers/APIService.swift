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
    
    func getTrendingMovies(completion: @escaping (Result<TrendingMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getTrendingMovies, completion: completion)
    }
    
    func getTrendingTvShows(completion: @escaping (Result<TrendingTvResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getTrendingTvShows, completion: completion)
    }
    
    func getPoppular(completion: @escaping (Result<TrendingMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getPopular, completion: completion)
    }
    
    func getUpcoming(completion: @escaping (Result<TrendingMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getUpcoming, completion: completion)
    }
    
    func getTopRated(completion: @escaping (Result<TrendingMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getTopRated, completion: completion)
    }
}
