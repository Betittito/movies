//
//  TokenEntity.swift
//  Architecture_VIPER
//
//  Created by Jesus Alberto Berlanga Reyes on 24/02/23.
//

import Foundation

struct TokenEntity: Decodable {
    let success: Bool
    let expiresDate: String
    let requestToekn: String
    
    enum CodingKeys: String, CodingKey{
        case success
        case expiresDate = "expires_at"
        case requestToekn = "request_token"
    }
}
