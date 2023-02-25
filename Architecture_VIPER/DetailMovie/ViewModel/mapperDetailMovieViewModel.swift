//
//  mapperDetailMovieViewModel.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 23/02/23.
//

import Foundation

struct MapperDetailMovieViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel{
        .init(title: entity.title,
              overview: entity.overview,
              voteCount: entity.voteCount,
              voteAverage: entity.voteAverage,
              status: entity.status,
              backDropPath:URL(string: "https://image.tmdb.org/t/p/w200" + entity.movieImage))
    }
}
