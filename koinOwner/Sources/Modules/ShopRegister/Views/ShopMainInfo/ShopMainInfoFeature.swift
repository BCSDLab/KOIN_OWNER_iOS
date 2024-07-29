//
//  ShopMainInfoFeature.swift
//  koinOwner
//
//  Created by 정영준 on 7/29/24.
//

import ComposableArchitecture

@Reducer
struct ShopMainInfoFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        var shopName: String = ""
        var address: String = ""
    }

    enum Action {
        case addImageButtonTapped
        case shopNameChanged(String)
        case addressChanged(String)
        case searchShopButtonTapped
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .addImageButtonTapped:
                return .none
            case let .shopNameChanged(shopName):
                state.shopName = shopName
                return .none
            case let .addressChanged(address):
                state.address = address
                return .none
            case .searchShopButtonTapped:
                return .none
            }
        }
    }
}
