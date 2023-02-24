//
//  DetailMovieEntity.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 23/02/23.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let movieImage: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String , CodingKey{
        case title, overview, status
        case movieImage = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
