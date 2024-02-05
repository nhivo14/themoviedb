//
//  HomeViewModel.swift
//  TheMovie
//
//  Created by NhiVHY on 05/02/2024.
//

import Foundation

class HomeViewModel {
    private var trendingMovies: [Movie] = [Movie]()
    private var trendingTVShows: [Tv] = [Tv]()
    private var popularMovies: [Movie] = [Movie]()
    private var upcomingMovies: [Movie] = [Movie]()
    private var topRatedMovies: [Movie] = [Movie]()
    
    
    //    MARK: Data Configuration
    func fetchTrendingMovies(completion: @escaping () -> Void) {
        APIService.shared.getTrendingMovies { [weak self] result in
            switch result {
            case .success(let response):
                self?.trendingMovies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
    func fetchTrendingTvShows(completion: @escaping () -> Void) {
        APIService.shared.getTrendingTvShows { [weak self] result in
            switch result {
            case .success(let response):
                self?.trendingTVShows = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
    func fetchPopularMovies(completion: @escaping () -> Void) {
        APIService.shared.getPoppular { [weak self] result in
            switch result {
            case .success(let response):
                self?.popularMovies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
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
    
    func fetchTopRatedMovies(completion: @escaping () -> Void) {
        APIService.shared.getTopRated { [weak self] result in
            switch result {
            case .success(let response):
                self?.topRatedMovies = response.results
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        }
    }
    
    func fetchDataAll(completion: @escaping () -> Void) {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchTrendingMovies {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchTrendingTvShows {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchPopularMovies {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchUpcomingMovies {
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchTopRatedMovies {
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            completion()
        }
    }
    
    
}

// MARK: - Methods
extension HomeViewModel {
    func getTrendingMovies() -> [Movie] {
        return trendingMovies
    }
    
    func getTrendingTvShows() -> [Tv] {
        return trendingTVShows
    }
    
    func getPopularMovies() -> [Movie] {
        return popularMovies
    }
    
    func getUpcomingMovies() -> [Movie] {
        return upcomingMovies
    }
    
    func getTopRatedMovies() -> [Movie] {
        return topRatedMovies
    }
    
}
