//
//  VerificationCodeRequest.swift
//  koinOwner
//
//  Created by 김나훈 on 8/17/24.
//

import Foundation

struct VerificationCodeRequest: Encodable {
    let phoneNumber: String
    let certificationCode: String
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case certificationCode = "certification_code"
    }
}
