//
//  DetailView.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 23/02/23.
//

import Foundation
import UIKit

class DetailView: UIViewController {
    private let presenter: DetailPresentable

    let movieImageView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let movieName: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32,
                                    weight: .bold,
                                    width: .condensed)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let movieVoteCount: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12,
                                    weight: .bold,
                                    width: .standard)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let movieVoteAverage: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12,
                                    weight: .bold,
                                    width: .standard)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let movieStatus: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12,
                                    weight: .bold,
                                    width: .standard)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let movieDescription: UILabel = {
       let label = UILabel()
        
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                    weight: .bold,
                                    width: .standard)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupView()
        presenter.onViewAppear()
    }
    
    func setupView(){
        view.addSubview(movieImageView)
        view.addSubview(movieVoteCount)
        view.addSubview(movieVoteAverage)
        view.addSubview(movieStatus)
        view.addSubview(movieName)
        view.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 300),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            movieVoteCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieVoteCount.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            movieVoteCount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            movieVoteAverage.leadingAnchor.constraint(equalTo: movieVoteCount.leadingAnchor, constant: 120),
            movieVoteAverage.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            
            movieStatus.leadingAnchor.constraint(equalTo: movieVoteAverage.leadingAnchor, constant: 120),
            movieStatus.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDescription.topAnchor.constraint(equalTo: movieVoteCount.bottomAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
}

extension DetailView: DetailPresenterUI {
    func updateUI(viewModel: DetailMovieViewModel) {
        let spaceBetweenDateVotes = "★"
        movieImageView.kf.setImage(with: viewModel.backDropPath)
        movieName.text = viewModel.title
        movieVoteCount.text = "Votación real: " + viewModel.voteCount.description
        movieVoteAverage.text = "Promedio: " + spaceBetweenDateVotes + viewModel.voteAverage.description
        movieStatus.text = "Status:" + viewModel.status
        movieDescription.text = viewModel.overview
    }
    
    
}
