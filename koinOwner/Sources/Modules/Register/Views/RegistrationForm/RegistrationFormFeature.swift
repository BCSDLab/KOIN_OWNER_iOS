//
//  RegistrationFormFeature.swift
//  koinOwner
//
//  Created by 김나훈 on 7/17/24.
//

import ComposableArchitecture

@Reducer
struct RegistrationFormFeature: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var phoneNumber: String = ""
        var phoneNumberResponseMessage: String = ""
        var verificationCode: String = ""
        var password: String = ""
        var confirmPassword: String = ""
        var isCompleted: Bool = false
    }
    
    enum Action {
        // User Button Action
        case sendCertificationNumber
        case checkCertificationNumber
        
        // Display Server Response
        case displayCertificationNumberResponse(Result<String, ErrorResponse>)
        
        // TextField Check
        
        // 전화번호 양식이 유효한지 검사
        case checkValidatePhoneNumber
        
        // 비밀번호 양식이 유효한지 검사
        case checkPasswordPattern
        
        // 비밀번호 확인이 일치하는지 검사
        case checkPasswordMatch
        
        case phoneNumberChanged(String)
        case verificationCodeChanged(String)
        case passwordchanged(String)
        case confirmPasswordChanged(String)
    }
    
    @Dependency(\.registerClient) var registerClient
    
    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .phoneNumberChanged(let text):
                state.phoneNumber = text
                return .none
            case .verificationCodeChanged(let text):
                state.verificationCode = text
                return .none
            case .passwordchanged(let text):
                state.password = text
                return .none
            case .confirmPasswordChanged(let text):
                state.confirmPassword = text
                return .none
            case .sendCertificationNumber:
                let phoneNumber = state.phoneNumber
                return .run { send in
                    do {
                        try await registerClient.sendSms(.init(phoneNumber: phoneNumber))
                        await send(.displayCertificationNumberResponse(.success("인증번호가 발송되었습니다.")))
                    } catch let error as ErrorResponse {
                        await send(.displayCertificationNumberResponse(.failure(error)))
                    }
                }
            case .displayCertificationNumberResponse(let result):
                switch result {
                case .success(let message):
                    state.phoneNumberResponseMessage = message
                case .failure(let error):
                    state.phoneNumberResponseMessage = error.message
                }
                return .none
            case .checkCertificationNumber:
                // TODO: 네트워크 요청
                return .none
            case .checkValidatePhoneNumber:
                // TODO: 정규표현식으로 전화번호 검사
                return .none
            case .checkPasswordPattern:
                // TODO: 정규표현식으로 비밀번호 검사
                return .none
            case .checkPasswordMatch:
                // TODO: 비밀번호와 비밀번호 확인이 일치한지 검사
                return .none
            }
        }
    }
}
