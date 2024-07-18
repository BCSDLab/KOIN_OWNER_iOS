//
//  RegisterView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/8/24.
//

import ComposableArchitecture
import SwiftUI

struct RegisterView: View {
    
    let store: StoreOf<RegisterFeature>
    
    init(store: StoreOf<RegisterFeature>) {
        self.store = store
    }
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<RegisterFeature.State, RegisterFeature.Action>) in
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Group {
                            switch viewStore.state.currentStep {
                            case 1: Text("1. 약관 동의")
                            case 2: Text("2. 기본 정보 입력")
                            default: Text("3. 사업자 인증")
                            }
                        }
                        
                        Spacer()
                        Text("\(viewStore.state.currentStep) / 3")
                    }
                     .progressBarTitle()

                    CustomProgressBar(progress: Double(viewStore.state.currentStep) / 3.0)
                        .frame(height: 8).padding(.top, 8)
                    switch viewStore.state.currentStep {
                    case 1:
                        PolicyAgreementView(store: .init(initialState: .init(), reducer: {
                            PolicyAgreementFeature()._printChanges()
                        }))
                    case 2:
                        RegistrationFormView(store: .init(initialState: .init(), reducer: {
                            RegistrationFormFeature()._printChanges()
                        }))
                    default:
                        BusinessVerificationView(store: .init(initialState: .init(), reducer: {
                            BusinessVerificationFeature()._printChanges()
                        }))
                    }
                    Spacer()
                    Button(action: {
                        switch viewStore.state.currentStep {
                        case 1, 2: viewStore.send(.nextButtonTapped)
                        default: viewStore.send(.completeButtonTapped)
                        }
                    }) {
                        Text("다음")
                            .mediumText(15, color: Color.neutral600)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(Color.neutral300)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    .padding(.bottom, 10)
                }.padding(.top, 16).padding(.horizontal, 16)
                    .navigationTitle("회원가입")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
}

#Preview {
    RegisterView(store: .init(initialState: .init(), reducer: {
        RegisterFeature()._printChanges()
    }))
}
