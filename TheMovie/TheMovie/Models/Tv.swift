//
//  Tv.swift
//  TheMovie
//
//  Created by NhiVHY on 31/01/2024.
//

import Foundation

struct Tv: Codable {
    let id: Int
    let original_language: String?
    let original_name: String?
    let overview: String?
    let poster_path: String?
    let media_type: String?
    let first_air_date: String?
    let vote_average: Double
    let vote_count: Int
    
}

struct TrendingTvResponse: Codable {
    let results: [Tv]
}
