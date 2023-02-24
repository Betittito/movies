//
//  SceneDelegate.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 17/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var router = ListOfMoviesRouter()
    var routerAuth = AuthenticationRouter()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        router.showListOfMovies(window: window)
        ///Se quedo pendiente la authentication, tiempo efectivo solo pude dar 8-10 hrs
//        routerAuth.showAuthentication(window: window)
    }
}

