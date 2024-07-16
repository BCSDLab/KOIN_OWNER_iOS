//
//  BusinessVerificationFeature.swift
//  koinOwner
//
//  Created by 김나훈 on 7/17/24.
//

import ComposableArchitecture

@Reducer
struct BusinessVerificationFeature: Reducer {
    
    @ObservableState
    struct State: Equatable {
        var ownerName: String = ""
        var shopName: String = ""
        var businessRegistrationNumber: String = ""
    }
    
    enum Action {
        case searchShopButtonTapped
        case addFileButtonTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .searchShopButtonTapped:
                // TODO: 네트워크 요청
                return .none
            case .addFileButtonTapped:
                // TODO: 네트워크 요청
                return .none
            }
        }
    }
}
