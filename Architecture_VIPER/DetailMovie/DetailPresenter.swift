//
//  DetailPresenter.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 23/02/23.
//

import Foundation

protocol DetailPresenterUI: AnyObject{
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject{
    var ui: DetailPresenterUI? { get }
    var movieID: String { get }
    func onViewAppear()
}
class DetailPresenter: DetailPresentable {
    weak var ui: DetailPresenterUI?
    let movieID: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailMovieViewModel
    
    init(interactor: DetailInteractable,
            movieID: String,
            mapper: MapperDetailMovieViewModel) {
        self.movieID = movieID
        self.interactor = interactor
        self.mapper = mapper
    }
       
    func onViewAppear() {
        Task{
            let model = await interactor.getDetailMovie(withId: movieID)
            let viewModel = mapper.map(entity: model)
            await MainActor.run(body: {
                self.ui?.updateUI(viewModel: viewModel)
            })
            
        }
    }
}
