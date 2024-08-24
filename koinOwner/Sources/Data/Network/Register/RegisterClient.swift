//
//  RegisterClient.swift
//  koinOwner
//
//  Created by 김나훈 on 8/19/24.
//

import Foundation
import Dependencies
import Moya

struct RegisterClient {
    var sendSms: @Sendable (VerificationSmsRequest) async throws -> Void
    var checkCode: @Sendable (VerificationCodeRequest) async throws -> TemporaryTokenResponse
    var fetchShops: @Sendable () async throws -> ShopsDTO
    var uploadFile: @Sendable () async throws -> String
    var tryRegister: @Sendable (OwnerRegisterRequest) async throws -> UploadFileResponse
}

extension RegisterClient: DependencyKey {
    static let liveValue: Self = {
        let nonTokenProvider = MoyaProvider<RegisterEndPoint>.buildNonToken()
        let provider = MoyaProvider<RegisterEndPoint>.build()
        
        return Self(
            sendSms: {
                try await nonTokenProvider.requestPlain(.sendSms($0))
            },
            checkCode: {
                try await nonTokenProvider.request(.checkCode($0))
            },
            fetchShops: {
                try await nonTokenProvider.request(.fetchShops)
            },
            uploadFile: {
                try await provider.request(.uploadFile)
            },
            tryRegister: {
                try await nonTokenProvider.request(.tryRegister($0))
            }
        )
    }()
    
}

extension DependencyValues {
    var registerClient: RegisterClient {
        get { self[RegisterClient.self] }
        set { self[RegisterClient.self] = newValue }
    }
}
