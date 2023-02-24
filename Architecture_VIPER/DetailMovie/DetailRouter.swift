//
//  DetailRouter.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 23/02/23.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromViewController: UIViewController ,movieID: String)
}

class DetailRouter: DetailRouting {
    func showDetail(fromViewController: UIViewController ,movieID: String){
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor,
                                            movieID: movieID,
                                            mapper: MapperDetailMovieViewModel())
        let view = DetailView(presenter: presenter)
        
        presenter.ui = view
        
        fromViewController.present(view, animated: true)
        
    }
}
