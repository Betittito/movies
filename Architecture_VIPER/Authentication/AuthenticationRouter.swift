//
//  AuthenticationRouter.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 24/02/23.
//

import Foundation
import UIKit

protocol AuthenticationRouting: AnyObject{
    var authenticationView: AuthenticationView? { get }
}

class AuthenticationRouter: AuthenticationRouting {
    var authenticationView: AuthenticationView?
    
    func showAuthentication(window: UIWindow?){
        let interactor = AuthenticationInteractor()
        let presenter = AuthenticationPresenter(authenticationPresenter: interactor)
        let view = AuthenticationView(presenter: presenter)
//     view.presenter = presenter
        presenter.ui = view
        authenticationView = view
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
    }
}
