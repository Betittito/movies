//
//  ListOfMoviesView.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController{
    private var moviesCollectionView: UICollectionView = {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width - 10
        let screenHeight = screenSize.height
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: screenWidth / 2, height: screenHeight / 2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCellView.self, forCellWithReuseIdentifier: "MovieCellView")
        
        return collectionView
    }()
    var presenter: ListOfMoviesPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        presenter?.onViewAppear()
    }
    
    
    private func setUpCollectionView() {
        view.addSubview(moviesCollectionView)
        
        NSLayoutConstraint.activate([
            moviesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            moviesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            moviesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            moviesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        moviesCollectionView.backgroundColor = .black
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
    }
}

extension ListOfMoviesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter!.models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        let model = presenter!.models[indexPath.row]
        
        cell.configureCell(model: model)
        
        return cell
    }
}

extension ListOfMoviesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.onTapCell(atIndex: indexPath.row)
    }
}

extension ListOfMoviesView: listOfMoviesUI{
    func update(movies: [PopularMovieEntity]) {
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
        print("modelos \(movies)")
    }
}

