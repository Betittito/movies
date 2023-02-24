//
//  MovieCEllView.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation
import UIKit
import Kingfisher

class MovieCellView: UICollectionViewCell{
    let stackViewMovies: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .darkGray
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 15
        
        return stackView
    }()
    
    let stackViewMoviesHorizontal: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    let movieImageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.borderColor = UIColor.orange.cgColor
        image.layer.cornerRadius = 15
        
        return image
    }()
    
    let titleMovie: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                 weight: .bold,
                                 width: .condensed)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let dateMovie: UILabel = {
       let label = UILabel()
       
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                    weight: .bold,
                                    width: .condensed)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let votesMovie: UILabel = {
       let label = UILabel()
       
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                    weight: .bold,
                                    width: .condensed)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    let descriptionMovie: UILabel = {
       let label = UILabel()
       
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 12,
                                    weight: .regular,
                                    width: .standard)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
//        setupViews()
        setupViewsWithStack()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupViews(){
//        addSubview(movieImageView)
//        addSubview(titleMovie)
//        addSubview(dateMovie)
//        addSubview(votesMovie)
//        addSubview(descriptionMovie)
//
//        NSLayoutConstraint.activate([
//            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            movieImageView.heightAnchor.constraint(equalToConstant: 50),
//            movieImageView.widthAnchor.constraint(equalToConstant: 180),
//            movieImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            titleMovie.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
//            titleMovie.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 40),
//            titleMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
//
//            dateMovie.leadingAnchor.constraint(equalTo: titleMovie.leadingAnchor),
//            dateMovie.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 10),
//
//            votesMovie.topAnchor.constraint(equalTo: dateMovie.topAnchor),
//            votesMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
//
//            descriptionMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            descriptionMovie.topAnchor.constraint(equalTo: dateMovie.bottomAnchor, constant: 8),
//            descriptionMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
//            ])
//    }
    
    func setupViewsWithStack(){
        addSubview(stackViewMovies)
//        addSubview(dateMovie)
//        addSubview(votesMovie)
//        addSubview(descriptionMovie)
        stackViewMoviesHorizontal.addArrangedSubview(dateMovie)
        stackViewMoviesHorizontal.addArrangedSubview(votesMovie)
        stackViewMovies.addArrangedSubview(movieImageView)
        stackViewMovies.addArrangedSubview(titleMovie)
        stackViewMovies.addArrangedSubview(stackViewMoviesHorizontal)
        stackViewMovies.addArrangedSubview(descriptionMovie)
        
        
        NSLayoutConstraint.activate([
            stackViewMovies.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewMovies.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackViewMovies.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewMovies.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            titleMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            votesMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionMovie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            ])
    }
    
    func configureCell(model: PopularMovieEntity) {
        let spaceBetweenDateVotes = "★"
        movieImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w200" + model.imageURL))
        titleMovie.text = model.title
        descriptionMovie.text = model.description
        dateMovie.text = model.date
        votesMovie.text = spaceBetweenDateVotes + String(model.votes)
    }
}
