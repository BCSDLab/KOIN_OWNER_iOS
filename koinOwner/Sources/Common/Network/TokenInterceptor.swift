//
//  TokenInterceptor.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Alamofire
import Dependencies
import Foundation

final class TokenInterceptor: RequestInterceptor {

    @Dependency(\.keychain) var keychain
    @Dependency(\.authClient) var authClient

    static let shared = TokenInterceptor()
    private init() { }

    /// AccessToken 헤더에 삽입
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = keychain.read(.accessToken) else {
            completion(.success(urlRequest))
            return
        }

        var urlRequest = urlRequest
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        completion(.success(urlRequest))

        print("🧤 Intercepted Token : ", accessToken)
    }
    
    /// AccessToken 재발급
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse,
              response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }

        print("🚀 Retry: statusCode: \(response.statusCode)")

        guard let accessToken = keychain.read(.accessToken),
              let refreshToken = keychain.read(.refreshToken) else {
            deleteAllToken()
            completion(.doNotRetryWithError(error))
            return
        }
        let tokenRequest = TokenRequest(refreshToken: refreshToken)

        Task {
            do {
                let tokenResponse = try await authClient.reissueToken(tokenRequest)

                guard let accessToken = tokenResponse.accessToken,
                      let refreshToken = tokenResponse.refreshToken else {
                    deleteAllToken()
                    completion(.doNotRetryWithError(error))
                    return
                }

                keychain.save(.accessToken, accessToken)
                keychain.save(.refreshToken, refreshToken)

                completion(.retryWithDelay(1))
            } catch {
                deleteAllToken()
                completion(.doNotRetryWithError(error))
            }
        }
    }

    private func deleteAllToken() {
        keychain.delete(.accessToken)
        keychain.delete(.refreshToken)
    }
}
