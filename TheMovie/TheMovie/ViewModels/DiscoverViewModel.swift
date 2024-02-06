//
//  DiscoverModel.swift
//  TheMovie
//
//  Created by NhiVHY on 06/02/2024.
//

import Foundation

class DiscoverViewModel {
    private var discoverMovies: [Movie] = [Movie]()
    
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
    
}

extension DiscoverViewModel {
    func getDiscoverMovies() -> [Movie] {
        return discoverMovies
    }
}
