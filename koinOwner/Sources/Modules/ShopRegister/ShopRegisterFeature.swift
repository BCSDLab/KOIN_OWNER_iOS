//
//  ShopRegisterFeature.swift
//  koinOwner
//
//  Created by 정영준 on 7/25/24.
//

import ComposableArchitecture

@Reducer
struct ShopRegisterFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        let registerType: ShopRegisterType
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
