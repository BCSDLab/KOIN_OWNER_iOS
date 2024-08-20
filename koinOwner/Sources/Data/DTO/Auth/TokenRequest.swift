//
//  TokenRequest.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

struct TokenRequest: Encodable {
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
    }
}
