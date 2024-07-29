//
//  ShopRegisterView.swift
//  koinOwner
//
//  Created by 정영준 on 7/10/24.
//

import SwiftUI
import ComposableArchitecture

struct ShopRegisterView: View {
    let store: StoreOf<ShopRegisterFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<ShopRegisterFeature.State, ShopRegisterFeature.Action>) in
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    switch viewStore.state.currentStep {
                    case 1: Text("1. 카테고리 설정")
                    case 2: Text("2. 메인 정보 입력")
                    case 3: Text("3. 세부 정보 입력")
                    case 4: Text("2. 가게 정보 확인")
                    default: EmptyView()
                    }
                    
                    Spacer()
                    
                    Text("\(viewStore.state.currentStep) / 4")
                }
                .progressBarTitle()
                .padding(.horizontal, 24)
                
                CustomProgressBar(progress: Double(viewStore.state.currentStep) / 4.0)
                    .padding(.top, 8)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 24)
                
                Group {
                    switch viewStore.state.currentStep {
                    case 1: CategorySelectView(currentStep: $currentStep)
                    case 2: ShopMainInfoView(currentStep: $currentStep)
                    case 3: ShopDetailInfoView(currentStep: $currentStep)
                    case 4: ShopInfoConfirmView(currentStep: $currentStep)
                    default: EmptyView()
                    }
                }
            }
            .customNavigationBar(viewStore.state.registerType.title, showBackButton: true, isColored: false)
        }
    }
}

enum ShopRegisterType {
    case register
    case management
    
    var title: String {
        switch self {
        case .register:
            return "가게 등록"
        case .management:
            return "가게 관리"
        }
    }
}

#Preview {
    ShopRegisterView(store: .init(initialState: .init(registerType: .register), reducer: {
        ShopRegisterFeature()._printChanges()
    }))
}
