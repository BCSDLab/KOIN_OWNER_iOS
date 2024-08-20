//
//  HTTPSession.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation
import Moya

final class HTTPSession {
    static let shared = HTTPSession()

    private init() {}

    let session: Moya.Session = {
        let session = Moya.Session(interceptor: TokenInterceptor.shared)
        return session
    }()
}
