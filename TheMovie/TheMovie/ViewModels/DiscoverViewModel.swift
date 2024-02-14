//
//  DiscoverModel.swift
//  TheMovie
//
//  Created by NhiVHY on 06/02/2024.
//

import Foundation

class DiscoverViewModel {
    private var discoverMovies: [Movie] = [Movie]()
    private var searchResultMovies: [Movie] = [Movie]()
    
    func fetchDiscoverMovies(completion: @escaping () -> Void) {
        APIService.shared.getDiscoverMovie { [weak self] result in
            switch result {
            case.success(let response):
                self?.discoverMovies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
    func searchMovies(with keyword: String, completion: @escaping () -> Void) {
        APIService.shared.searchMovies(keyword: keyword) { result in
            switch result {
            case .success(let response):
                self.searchResultMovies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
}

extension DiscoverViewModel {
    func getDiscoverMovies() -> [Movie] {
        return discoverMovies
    }
    
    func getSearchResult() -> [Movie] {
        return searchResultMovies
    }
}
