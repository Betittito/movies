//
//  PopularMovieEntity.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation

struct PopularMovieEntity: Decodable {
    var id: Int
    var imageURL: String
    var description: String
    var title: String
    var votes: Double
    var date: String
    
    enum CodingKeys: String, CodingKey{
        case id, title
        case imageURL = "poster_path"
        case description = "overview"
        case votes = "vote_average"
        case date = "release_date"
    }
}
