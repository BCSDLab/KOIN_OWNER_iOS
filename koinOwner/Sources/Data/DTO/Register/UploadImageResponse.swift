//
//  UploadImageResponse.swift
//  koinOwner
//
//  Created by 김나훈 on 8/19/24.
//

struct AttachmentUrl: Codable {
    let fileUrl: String

    enum CodingKeys: String, CodingKey {
        case fileUrl = "file_url"
    }
}
