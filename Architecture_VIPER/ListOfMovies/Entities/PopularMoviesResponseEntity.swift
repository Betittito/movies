//
//  PopularMoviesResponseEntity.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation

struct PopularMoviesResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
