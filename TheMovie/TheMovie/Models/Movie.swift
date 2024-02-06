//
//  Movie.swift
//  TheMovie
//
//  Created by NhiVHY on 30/01/2024.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let original_language: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let media_type: String?
    let release_date: String?
    let vote_average: Double?
    let vote_count: Int?
    
}

struct ListMoviesResponse: Codable {
    let results: [Movie]
}
/* "adult": false,
 "backdrop_path": "/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg",
 "id": 572802,
 "title": "Aquaman and the Lost Kingdom",
 "original_language": "en",
 "original_title": "Aquaman and the Lost Kingdom",
 "overview": "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.",
 "poster_path": "/7lTnXOy0iNtBAdRP3TZvaKJ77F6.jpg",
 "media_type": "movie",
 "genre_ids": [
 28,
 12,
 14
 ],
 "popularity": 6996.108,
 "release_date": "2023-12-20",
 "video": false,
 "vote_average": 7.002,
 "vote_count": 1105*/
