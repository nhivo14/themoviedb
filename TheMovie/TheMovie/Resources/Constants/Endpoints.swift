//
//  Endpoints.swift
//  TheMovie
//
//  Created by NhiVHY on 30/01/2024.
//

import Foundation

struct Endpoints {
//    MARK: - Trending
    static let getAllTrending = "/trending/all/day?api_key=" + Constants.API_KEY
    static let getTrendingMovies = "/trending/movie/day?api_key=" + Constants.API_KEY
    static let getTrendingTvShows = "/trending/tv/day?api_key=" + Constants.API_KEY
    static let getPopular = "/movie/popular?api_key=" + Constants.API_KEY
    static let getUpcoming = "/movie/upcoming?api_key=" + Constants.API_KEY
    static let getTopRated = "/movie/top_rated?api_key=" + Constants.API_KEY
}
