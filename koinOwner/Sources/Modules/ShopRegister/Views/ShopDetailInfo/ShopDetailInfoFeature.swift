//
//  ShopDetailInfoFeature.swift
//  koinOwner
//
//  Created by 정영준 on 7/29/24.
//

import ComposableArchitecture

@Reducer
struct ShopDetailInfoFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        var phoneNumber: String = ""
        var deliveryFee: String = ""
        var otherInfo: String = ""
        var availableOptions: [Bool] = .init(repeating: false, count: AvailableOptions.allCases.count)
    }

    enum Action {
        case phoneNumberChanged(String)
        case deliveryFeeChanged(String)
        case otherInfoChanged(String)
        case editTimeButtonTapped
        case availableToggleButtonTapped(AvailableOptions)
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case let .phoneNumberChanged(phoneNumber):
                state.phoneNumber = phoneNumber
                return .none
            case let .deliveryFeeChanged(deliveryFee):
                state.deliveryFee = deliveryFee
                return .none
            case let .otherInfoChanged(otherInfo):
                state.otherInfo = otherInfo
                return .none
            case let .editTimeButtonTapped:
                return .none
            case let .availableToggleButtonTapped(option):
                state.availableOptions[option.rawValue].toggle()
                return .none
            }
        }
    }
}

enum AvailableOptions: Int, CaseIterable {
    case delivery = 0
    case card = 1
    case account = 2
    
    var title: String {
        switch self {
        case .delivery:
            return "배달"
        case .card:
            return "카드"
        case .account:
            return "계좌이체"
        }
    }
}
