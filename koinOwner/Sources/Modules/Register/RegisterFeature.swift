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
        var currentStep: Int = 1
    }

    enum Action {
        case nextButtonTapped
        case completeButtonTapped
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .nextButtonTapped:
                state.currentStep += 1
                return .none
            case .completeButtonTapped:
                // TODO: 네트워크 요청
                return .none
            }
        }
    }
}
