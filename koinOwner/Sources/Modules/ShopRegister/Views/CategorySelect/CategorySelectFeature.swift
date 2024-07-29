//
//  CategorySelectFeature.swift
//  koinOwner
//
//  Created by 정영준 on 7/29/24.
//

import ComposableArchitecture

@Reducer
struct CategorySelectFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        var selectedCategory: ShopCategory = .none
    }

    enum Action {
        case categoryButtonTapped(ShopCategory)
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case let .categoryButtonTapped(category):
                state.selectedCategory = category
                return .none
            }
        }
    }
}
