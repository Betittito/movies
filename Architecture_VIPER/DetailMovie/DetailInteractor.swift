//
//  DetailInteractor.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 23/02/23.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=a7520e15217c6a1091b4ac2b59862f54")!
        let (data, _) = try! await URLSession.shared.data(from: url)
       
        return try! JSONDecoder().decode(DetailMovieEntity.self, from: data)
    }
}
