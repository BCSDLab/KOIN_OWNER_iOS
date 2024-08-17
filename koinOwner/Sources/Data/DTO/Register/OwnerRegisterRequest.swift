//
//  OwnerRegisterRequest.swift
//  koinOwner
//
//  Created by 김나훈 on 8/17/24.
//

import Foundation

struct OwnerRegisterRequest: Encodable {
    let companyNumber, name, password, phoneNumber: String
    let shopID: Int
    let shopName: String
    let attachmentUrls: [AttachmentURL]

    enum CodingKeys: String, CodingKey {
        case companyNumber = "company_number"
        case name, password
        case phoneNumber = "phone_number"
        case shopID = "shop_id"
        case shopName = "shop_name"
        case attachmentUrls = "attachment_urls"
    }
}

struct AttachmentURL: Encodable {
    let fileUrl: String

    enum CodingKeys: String, CodingKey {
        case fileUrl = "file_url"
    }
}
