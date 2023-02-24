//
//  AuthenticationPresenter.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 24/02/23.
//

import Foundation

protocol AuthenticationPresenterUI: AnyObject{
    func updateUI(model: TokenEntity)
}

protocol AuthenticationPresentable: AnyObject {
    var ui: AuthenticationPresenterUI? { get }
    func onViewAppear()
}

class AuthenticationPresenter: AuthenticationPresentable{
    private let authenticationPresenter : AuthenticationInteractable
//    var tokenModel: TokenEntity
    weak var ui: AuthenticationPresenterUI?
    
    init(authenticationPresenter: AuthenticationInteractable/*, tokenModel: TokenEntity*/) {
        self.authenticationPresenter = authenticationPresenter
//        self.tokenModel = tokenModel
    }
    func onViewAppear(){
        Task{
            let tokenModel = await authenticationPresenter.getToken()
            await MainActor.run(body: {
                self.ui?.updateUI(model: tokenModel)
            })
            print(tokenModel)
        }
    }
}
