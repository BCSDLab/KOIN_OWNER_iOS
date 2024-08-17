//
//  VerificationSmsRequest.swift
//  koinOwner
//
//  Created by 김나훈 on 8/17/24.
//

import Foundation

struct VerificationSmsRequest: Encodable {
    let phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
    }
}
