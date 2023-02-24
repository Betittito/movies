//
//  ListOfMoviesInteractor.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation

protocol ListOfMoviesInteractable: AnyObject{
    func getListOfMovies() async -> PopularMoviesResponseEntity
}
//a7520e15217c6a1091b4ac2b59862f54
class ListOfMoviesInteractor: ListOfMoviesInteractable {
    
    func getListOfMovies() async -> PopularMoviesResponseEntity{
        let url = URL(string: "https://api.themoviedb.org/3//movie/popular?api_key=a7520e15217c6a1091b4ac2b59862f54")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        return try! JSONDecoder().decode(PopularMoviesResponseEntity.self, from: data)
    }
    
}
