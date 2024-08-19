//
//  RegisterFeature.swift
//  koinOwner
//
//  Created by 김나훈 on 7/16/24.
//

import ComposableArchitecture

@Reducer
struct RegisterFeature: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var currentStep: RegisterTab = .one
        var policyAgreement: PolicyAgreementFeature.State = .init()
        var registrationForm: RegistrationFormFeature.State = .init()
        var businessVerification: BusinessVerificationFeature.State = .init()
        
        var isNextButtonEnabled: Bool {
            switch currentStep {
            case .one:
                return policyAgreement.isCompleted
            case .two:
                return registrationForm.isCompleted
            case .three:
                return businessVerification.isCompleted
            }
        }
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case nextButtonTapped
        case completeButtonTapped
        case policyAgreement(PolicyAgreementFeature.Action)
        case registrationForm(RegistrationFormFeature.Action)
        case businessVerification(BusinessVerificationFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Scope(state: \.policyAgreement, action: \.policyAgreement) { PolicyAgreementFeature() }
        Scope(state: \.registrationForm, action: \.registrationForm) { RegistrationFormFeature() }
        Scope(state: \.businessVerification, action: \.businessVerification) { BusinessVerificationFeature() }

        Reduce<State, Action> { state, action in
            switch action {
            case .nextButtonTapped:
                state.currentStep = state.currentStep.next()
                return .none
            case .completeButtonTapped:
                // TODO: 네트워크 요청
                return .none
            default:
                return .none
            }
        }
    }
}
