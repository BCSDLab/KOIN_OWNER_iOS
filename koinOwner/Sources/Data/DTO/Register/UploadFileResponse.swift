//
//  UploadFileResponse.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

struct UploadFileResponse: Decodable {
    let fileUrl: String
    
    enum CodingKeys: String, CodingKey {
        case fileUrl = "file_url"
    }
}
