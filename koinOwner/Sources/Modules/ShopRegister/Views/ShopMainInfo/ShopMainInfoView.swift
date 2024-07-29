//
//  ShopMainInfoView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI
import ComposableArchitecture

struct ShopMainInfoView: View {
    let store: StoreOf<ShopMainInfoFeature>
    @ObservedObject var viewStore: ViewStore<ShopMainInfoFeature.State, ShopMainInfoFeature.Action>
    
    init(store: StoreOf<ShopMainInfoFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                viewStore.send(.addImageButtonTapped)
            } label: {
                VStack(spacing: 0) {
                    Image(.imgSpoonFork)
                        .customImage(width: 64, height: 64)
                        .padding(.bottom, 8)
                    
                    Text("영역을 선택하여 이미지를 추가하세요.")
                        .mediumText(14, color: Color.neutral500)
                }
                .padding(.vertical, 54)
                .padding(.horizontal, 38)
                .background(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1).foregroundStyle(Color.neutral500))
            }
            .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("가게명")
                    .textFieldTitle()
                    .padding(.leading, 8)
                    .padding(.bottom, 7)
                
                HStack(spacing: 16) {
                    CustomTextField(placeholder: "가게명을 입력하세요.",
                                    text: viewStore.binding(
                                        get: \.shopName,
                                        send: ShopMainInfoFeature.Action.shopNameChanged))
                    
                    Button {
                        viewStore.send(.searchShopButtonTapped)
                    } label: {
                        Text("가게 검색")
                            .mediumText(15, color: Color.neutral0)
                            .frame(height: 46)
                            .padding(.horizontal, 16)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                .padding(.bottom, 24)
                
                Text("주소정보")
                    .textFieldTitle()
                    .padding(.leading, 8)
                    .padding(.bottom, 7)
                
                CustomTextField(placeholder: "주소를 입력하세요.", 
                                text: viewStore.binding(
                                    get: \.address,
                                    send: ShopMainInfoFeature.Action.addressChanged))
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
        }
    }
}

#Preview {
    ShopMainInfoView(store: .init(initialState: .init(), reducer: {
        ShopMainInfoFeature()._printChanges()
    }))
}
