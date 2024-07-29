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
        var categorySelect = CategorySelectFeature.State()
        var shopMainInfo = ShopMainInfoFeature.State()
        var shopDetailInfo = ShopDetailInfoFeature.State()
    }

    enum Action {
        case nextButtonTapped
        case previousButtonTapped
        case completeButtonTapped
        case categorySelect(CategorySelectFeature.Action)
        case shopMainInfo(ShopMainInfoFeature.Action)
        case shopDetailInfo(ShopDetailInfoFeature.Action)
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .nextButtonTapped:
                state.currentStep += 1
                return .none
            case .previousButtonTapped:
                state.currentStep -= 1
                return .none
            case .completeButtonTapped:
                // TODO: 네트워크 요청
                return .none
            default:
                return .none
            }
        }
        Scope(state: \.categorySelect, action: \.categorySelect) {
            CategorySelectFeature()
        }
        Scope(state: \.shopMainInfo, action: \.shopMainInfo) {
            ShopMainInfoFeature()
        }
        Scope(state: \.shopDetailInfo, action: \.shopDetailInfo) {
            ShopDetailInfoFeature()
        }
    }
}
