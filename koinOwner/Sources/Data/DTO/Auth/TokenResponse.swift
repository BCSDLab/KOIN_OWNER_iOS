//
//  TokenResponse.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

struct TokenResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
