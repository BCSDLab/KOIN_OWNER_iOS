//
//  ShopDetailInfoView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI
import ComposableArchitecture

struct ShopDetailInfoView: View {
    let store: StoreOf<ShopDetailInfoFeature>
    @ObservedObject var viewStore: ViewStore<ShopDetailInfoFeature.State, ShopDetailInfoFeature.Action>
    
    init(store: StoreOf<ShopDetailInfoFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("전화번호")
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "전화번호를 입력하세요.", 
                            text: viewStore.binding(
                                get: \.phoneNumber,
                                send: ShopDetailInfoFeature.Action.phoneNumberChanged))
                .padding(.bottom, 24)
            
            Text("배달금액")
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "배달금액을 입력하세요.", 
                            text: viewStore.binding(
                                get: \.deliveryFee,
                                send: ShopDetailInfoFeature.Action.deliveryFeeChanged))
                .padding(.bottom, 24)
            
            Text("운영시간")
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            HStack(spacing: 16) {
                Text("00:00 ~ 24:00")
                    .regularText(18, color: Color.neutral500)
                
                Spacer()
                
                CustomButton(action: {
                    viewStore.send(.editTimeButtonTapped)
                }, label: {
                    Text("시간수정")
                }, width: 84, height: 46)
                
            }
            .padding(.bottom, 24)
            
            Text("기타정보")
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "기타정보를 입력하세요.",
                            text: viewStore.binding(
                                get: \.otherInfo,
                                send: ShopDetailInfoFeature.Action.otherInfoChanged))
                .padding(.bottom, 34)
            
            HStack(spacing: 24) {
                Button {
                    viewStore.send(.availableToggleButtonTapped(.delivery), animation: .default)
                } label: {
                    HStack(spacing: 8) {
                        Image(viewStore.state.availableOptions[AvailableOptions.delivery.rawValue] ? .btnToggleOn : .btnToggleOff)
                            .customImage(width: 16, height: 16)
                        
                        Text("배달 가능")
                            .mediumText(14, color: viewStore.state.availableOptions[AvailableOptions.delivery.rawValue] ? Color.sub500 : Color.neutral500)
                    }
                }

                Button {
                    viewStore.send(.availableToggleButtonTapped(.card), animation: .default)                } label: {
                    HStack(spacing: 8) {
                        Image(viewStore.state.availableOptions[AvailableOptions.card.rawValue] ? .btnToggleOn : .btnToggleOff)
                            .customImage(width: 16, height: 16)
                        
                        Text("카드 가능")
                            .mediumText(14, color: viewStore.state.availableOptions[AvailableOptions.card.rawValue] ? Color.sub500 : Color.neutral500)
                    }
                }
                
                Button {
                    viewStore.send(.availableToggleButtonTapped(.account), animation: .default)
                } label: {
                    HStack(spacing: 8) {
                        Image(viewStore.state.availableOptions[AvailableOptions.account.rawValue] ? .btnToggleOn : .btnToggleOff)
                            .customImage(width: 16, height: 16)
                        
                        Text("계좌이체 가능")
                            .mediumText(14, color: viewStore.state.availableOptions[AvailableOptions.account.rawValue] ? Color.sub500 : Color.neutral500)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    ShopDetailInfoView(store: .init(initialState: .init(), reducer: {
        ShopDetailInfoFeature()._printChanges()
    }))
}
