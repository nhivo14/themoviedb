//
//  UpcomingViewModel.swift
//  TheMovie
//
//  Created by NhiVHY on 05/02/2024.
//

import Foundation

class UpcomingViewModel {
    private var upcomingMovies: [Movie] = [Movie]()
    
    func fetchUpcomingMovies(completion: @escaping () -> Void) {
        APIService.shared.getUpcoming { [weak self] result in
            switch result {
            case .success(let response):
                self?.upcomingMovies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
}

extension UpcomingViewModel {
    func getUpcomingMovies() -> [Movie] {
        return upcomingMovies
    }
}
