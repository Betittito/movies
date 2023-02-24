//
//  AuthenticationInteractor.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 24/02/23.
//

import Foundation

protocol AuthenticationInteractable: AnyObject {
    func getToken() async -> TokenEntity
}
//a7520e15217c6a1091b4ac2b59862f54
class AuthenticationInteractor: AuthenticationInteractable{
    
    func getToken() async -> TokenEntity{
        let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=a7520e15217c6a1091b4ac2b59862f54")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        return try! JSONDecoder().decode(TokenEntity.self, from: data)
    }
    
    func postSession(token: String) async -> TokenEntity{
        let url = URL(string: "https://api.themoviedb.org/3/authentication/session/new?api_key=a7520e15217c6a1091b4ac2b59862f54")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let post = "request_token=\(token)"
        var request = URLRequest(url: url)
        request.httpBody = post.data(using: .utf8)
        ///Se me terminó el tiempo, hasta aqui pude darle, solo pude darle un dia completo
        
        return try! JSONDecoder().decode(TokenEntity.self, from: data)
    }
}
