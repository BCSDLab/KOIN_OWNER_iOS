//
//  ErrorResponse.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

struct ErrorResponse: Error, Decodable {
    let code: String
    let message: String
    
    static let base = ErrorResponse(code: "000", message: "CannotParse")
}
