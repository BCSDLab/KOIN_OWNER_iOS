//
//  Bundle+Secrets.swift
//  koinOwner
//
//  Created by 김나훈 on 8/21/24.
//

import Foundation

extension Bundle {
    var baseURL: URL {
        #if DEBUG
        guard let urlString = object(forInfoDictionaryKey: "DEV_BASE_URL") as? String else {
            return URL(fileURLWithPath: "")
        }
        #elseif RELEASE
        guard let urlString = object(forInfoDictionaryKey: "RELEASE_BASE_URL") as? String else {
            return URL(fileURLWithPath: "")
        }
        #else
        return URL(fileURLWithPath: "")
        #endif
        print(urlString)
        guard let url = URL(string: urlString) else {
            return URL(fileURLWithPath: "")
        }
        return url
    }
}
