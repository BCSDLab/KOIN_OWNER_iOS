//
//  AuthClient.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation
import Dependencies
import Moya

struct AuthClient {
    var reissueToken: @Sendable (TokenRequest) async throws -> TokenResponse
}

extension AuthClient: DependencyKey {
    static let liveValue: Self = {
        let nonTokenProvider = MoyaProvider<AuthEndpoint>.buildNonToken()
        let provider = MoyaProvider<AuthEndpoint>.build()

        return Self(
            reissueToken: {
                try await nonTokenProvider.request(.reissueToken(request: $0))
            }
        )
    }()

}

extension DependencyValues {
    var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
