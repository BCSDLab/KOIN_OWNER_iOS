//
//  PolicyAgreementFeature.swift
//  koinOwner
//
//  Created by 김나훈 on 7/17/24.
//

import ComposableArchitecture

@Reducer
struct PolicyAgreementFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        var isAgreeAllButtonToggled = false
        var isPersonalInformationButtonToggled = false
        var isKoinButtonToggled = false
    }

    enum Action {
        case agreeAllButtonTapped
        case personalInformationButtonTapped
        case koinButtonTapped
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .agreeAllButtonTapped:
                state.isAgreeAllButtonToggled.toggle()
                state.isPersonalInformationButtonToggled = state.isAgreeAllButtonToggled
                state.isKoinButtonToggled = state.isAgreeAllButtonToggled
                return .none
            case .personalInformationButtonTapped:
                state.isPersonalInformationButtonToggled.toggle()
                return .none
            case .koinButtonTapped:
                state.isKoinButtonToggled.toggle()
                return .none
            }
        }
    }
}
