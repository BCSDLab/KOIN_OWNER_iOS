//
//  RegisterView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/8/24.
//

import ComposableArchitecture
import SwiftUI

struct RegisterView: View {
    
    @Bindable private var store: StoreOf<RegisterFeature>
    
    init(store: StoreOf<RegisterFeature>) {
        self.store = store
    }
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<RegisterFeature.State, RegisterFeature.Action>) in
            NavigationView {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(viewStore.state.currentStep.message)
                        Spacer()
                        Text("\(viewStore.state.currentStep.rawValue) / \(RegisterTab.allCases.count)")
                    }
                     .progressBarTitle()

                    CustomProgressBar(progress: Double(viewStore.state.currentStep.rawValue) / Double(RegisterTab.allCases.count))
                        .frame(height: 8).padding(.top, 8)
                    switch viewStore.state.currentStep {
                    case .one:
                        PolicyAgreementView(store: store.scope(state: \.policyAgreement, action: \.policyAgreement))
                    case .two:
                        RegistrationFormView(store: store.scope(state: \.registrationForm, action: \.registrationForm))
                    case .three:
                        BusinessVerificationView(store: store.scope(state: \.businessVerification, action: \.businessVerification))
                    }
                    Spacer()
                    Button(action: {
                        switch viewStore.state.currentStep {
                        case .one, .two: viewStore.send(.nextButtonTapped)
                        case .three: viewStore.send(.completeButtonTapped)
                        }
                    }) {
                        Text("다음")
                            .mediumText(15, color: viewStore.state.isNextButtonEnabled ? Color.neutral0 : Color.neutral600)
                            .frame(maxWidth: .infinity, minHeight: 48)
                            .background(viewStore.state.isNextButtonEnabled ? Color.main500 : Color.neutral300)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                    .padding(.bottom, 10)
                    .disabled(!viewStore.state.isNextButtonEnabled)
                }.padding(.top, 16).padding(.horizontal, 16)
                    .navigationTitle("회원가입")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
}

#Preview {
    RegisterView(store: .init(initialState: .init(), reducer: {
        RegisterFeature()
    }))
}
