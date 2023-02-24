//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation

//Delegation pattern
protocol ListOfMoviesPresentable: AnyObject {
    var ui: listOfMoviesUI? { get }
    var models: [PopularMovieEntity] { get }
    func onViewAppear()
}

protocol listOfMoviesUI: AnyObject{
    func update(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable{
    var ui: listOfMoviesUI?
    private let listOfMoviesInteractor : ListOfMoviesInteractable
    var models: [PopularMovieEntity] = []
    
    private let router: ListOfMoviesRouting
    
    init(listOfMoviesInteractor: ListOfMoviesInteractable, router: ListOfMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.router = router
    }
    
    func onViewAppear(){
        Task {
            models = await listOfMoviesInteractor.getListOfMovies().results
            ui?.update(movies: models)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieID = models[atIndex].id
        router.showDetailMovie(movieID: movieID.description)
        print(movieID)
    }
}
