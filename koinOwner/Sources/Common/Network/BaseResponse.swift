//
//  BaseResponse.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let code: String
    let message: String
    let data: T
}
