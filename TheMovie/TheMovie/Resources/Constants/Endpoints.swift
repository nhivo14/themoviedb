//
//  Endpoints.swift
//  TheMovie
//
//  Created by NhiVHY on 30/01/2024.
//

import Foundation

struct Endpoints {
//    MARK: - Get Movies and Tvs
    static let getAllTrending = "/trending/all/day"
    static let getTrendingMovies = "/trending/movie/day"
    static let getTrendingTvShows = "/trending/tv/day"
    static let getPopular = "/movie/popular"
    static let getUpcoming = "/movie/upcoming"
    static let getTopRated = "/movie/top_rated"
    
//    MARK: - Discover
    static let getDiscoverMovies = "/discover/movie"
}

