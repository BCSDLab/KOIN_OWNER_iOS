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
    @ObservedObject var viewStore: ViewStore<ShopRegisterFeature.State, ShopRegisterFeature.Action>
    
    init(store: StoreOf<ShopRegisterFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
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
                case 1: CategorySelectView(
                    store: self.store.scope(
                        state: \.categorySelect,
                        action: \.categorySelect
                    )
                )
                case 2: ShopMainInfoView(
                    store: self.store.scope(
                        state: \.shopMainInfo,
                        action: \.shopMainInfo
                    )
                )
                case 3: ShopDetailInfoView(
                    store: self.store.scope(
                        state: \.shopDetailInfo,
                        action: \.shopDetailInfo
                    )
                )
                case 4: shopInfoConfirmView
                default: EmptyView()
                }
            }
            
            Spacer()
            
            Group {
                switch viewStore.state.currentStep {
                case 1: nextButton
                case 2, 3: prevAndNextButton
                case 4: prevAndCompleteButton
                default: EmptyView()
                }
            }
        }
        .customNavigationBar(viewStore.state.registerType.title, showBackButton: true, isColored: false)
        
    }
}

extension ShopRegisterView {
    var nextButton: some View {
        CustomButton(action: {
            viewStore.send(.nextButtonTapped, animation: .default)
        }, label: {
            Text("다음")
        }, isDisabled: viewStore.state.categorySelect.selectedCategory == .none)
        .padding(.horizontal, 24)
    }
    
    var prevAndNextButton: some View {
        HStack(spacing: 12) {
            CustomSubButton {
                viewStore.send(.previousButtonTapped, animation: .default)
            } label: {
                Text("이전")
            }
            .frame(width: UIScreen.screenWidth / 4)
            
            CustomButton {
                viewStore.send(.nextButtonTapped, animation: .default)
            } label: {
                Text("다음")
            }
        }
        .padding(.horizontal, 24)
    }
    
    var prevAndCompleteButton: some View {
        HStack(spacing: 12) {
            CustomSubButton {
                viewStore.send(.previousButtonTapped, animation: .default)
            } label: {
                Text("이전")
            }
            .frame(width: UIScreen.screenWidth / 4)
            
            CustomButton {
                viewStore.send(.completeButtonTapped, animation: .default)
            } label: {
                Text("등록")
            }
        }
        .padding(.horizontal, 24)
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
