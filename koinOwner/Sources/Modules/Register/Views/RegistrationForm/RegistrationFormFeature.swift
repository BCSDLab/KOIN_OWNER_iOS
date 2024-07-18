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
       var verificationCode: String = ""
       var password: String = ""
       var confirmPassword: String = ""
    }

    enum Action {
        // User Button Action
        case sendCertificationNumber
        case checkCertificationNumber
        
        // TextField Check
        
        // 전화번호 양식이 유효한지 검사
        case checkValidatePhoneNumber
        
        // 비밀번호 양식이 유효한지 검사
        case checkPasswordPattern
        
        // 비밀번호 확인이 일치하는지 검사
        case checkPasswordMatch
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .sendCertificationNumber:
                // TODO: 네트워크 요청
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
