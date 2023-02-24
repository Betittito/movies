//
//  ListOfMoviesRouter.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject{
    var detailRouter: DetailRouting? { get }
    var listOfMoviesView: ListOfMoviesView? { get }
    
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(movieID: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    var detailRouter: DetailRouting?
    var listOfMoviesView: ListOfMoviesView?
    
    func showListOfMovies(window: UIWindow?){
        self.detailRouter = DetailRouter()
        let view = ListOfMoviesView()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor, router: self)
        
        view.presenter = presenter
        presenter.ui = view
        listOfMoviesView = view
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(movieID: String) {
        guard let fromVoewController = listOfMoviesView else {
            return
        }
        detailRouter?.showDetail(fromViewController: fromVoewController, movieID: movieID)
    }
}
