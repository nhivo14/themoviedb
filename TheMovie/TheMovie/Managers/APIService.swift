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
    
//    MARK: - Get Movies and TVs
    func getAllTrending(completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getAllTrending, completion: completion)
    }
    
    func getTrendingMovies(completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getTrendingMovies, completion: completion)
    }
    
    func getTrendingTvShows(completion: @escaping (Result<ListTvResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getTrendingTvShows, completion: completion)
    }
    
    func getPoppular(completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getPopular, completion: completion)
    }
    
    func getUpcoming(completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getUpcoming, completion: completion)
    }
    
    func getTopRated(completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getTopRated, completion: completion)
    }
    
//    MARK: - Discover
    func getDiscoverMovie(completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        networkManager.get(endpoint: Endpoints.getDiscoverMovies, completion: completion)
    }
    
//    MARK: - Search
    func searchMovies(keyword: String, completion: @escaping (Result<ListMoviesResponse, Error>) -> Void) {
        guard let query = keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        let parameters: [String: Any] = [
            "query": query
        ]
        networkManager.get(endpoint: Endpoints.searchMovies, parameters: parameters, completion: completion)
    }
}
