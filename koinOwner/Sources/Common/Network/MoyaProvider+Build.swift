//
//  MoyaProvider+Build.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Moya

extension MoyaProvider {
    static func build() -> MoyaProvider<Target> {
        return MoyaProvider<Target>(
            session: HTTPSession.shared.session,
            plugins: [MoyaLoggerPlugin()]
        )
    }

    static func buildNonToken() -> MoyaProvider<Target> {
        return MoyaProvider<Target>(
            session: Moya.Session(),
            plugins: [MoyaLoggerPlugin()]
        )
    }
}
