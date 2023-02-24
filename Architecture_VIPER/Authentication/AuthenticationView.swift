//
//  AuthenticationView.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 24/02/23.
//

import Foundation
import UIKit

class AuthenticationView: UIViewController{
    private let presenter : AuthenticationPresentable?
    
    init(presenter: AuthenticationPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
                   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupView()
        presenter?.onViewAppear()
    }
    
    func setupView(){
        view.addSubview(movieName)
        view.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieName.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

extension AuthenticationView: AuthenticationPresenterUI {
    func updateUI(model: TokenEntity) {
        movieName.text = model.expiresDate
        movieDescription.text = "false"
    }
    
    
}
