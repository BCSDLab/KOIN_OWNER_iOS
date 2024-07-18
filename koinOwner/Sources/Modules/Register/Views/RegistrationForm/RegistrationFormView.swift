//
//  RegistrationFormView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/4/24.
//

import ComposableArchitecture
import SwiftUI

struct RegistrationFormView: View {
    let store: StoreOf<RegistrationFormFeature>
    
    init(store: StoreOf<RegistrationFormFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<RegistrationFormFeature.State, RegistrationFormFeature.Action>) in
            VStack(alignment: .leading, spacing: 0) {
                Text("전화번호")
                    .padding(.top, 25)
                    .padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                
                HStack {
                    CustomTextField(
                        placeholder: "- 없이 번호를 입력해주세요.",
                        text: viewStore.binding(
                            get: \.phoneNumber,
                            send: RegistrationFormFeature.Action.checkValidatePhoneNumber
                        )
                    )
                    .padding(.top, 7)
                    
                    Spacer()
                    
                    Button(action: {
                        viewStore.send(.sendCertificationNumber)
                    }) {
                        Text("인증번호 발송")
                            .frame(width: 106, height: 41)
                            .font(.pretendard(.medium, size: 15))
                            .foregroundStyle(Color.neutral0)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                
                Text("인증번호")
                    .padding(.top, 25)
                    .padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                
                HStack {
                    CustomTextField(
                        placeholder: "인증번호를 입력해주세요.",
                        text: Binding(
                            get: { viewStore.verificationCode },
                            set: { _ in }
                        )
                    )
                    .padding(.top, 7)
                    
                    Spacer()
                    
                    Button(action: {
                        viewStore.send(.checkCertificationNumber)
                    }) {
                        Text("인증번호 확인")
                            .frame(width: 106, height: 41)
                            .font(.pretendard(.medium, size: 15))
                            .foregroundStyle(Color.neutral0)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                
                Text("비밀번호")
                    .padding(.top, 25)
                    .padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                
                CustomTextField(
                    placeholder: "비밀번호를 입력해주세요.",
                    isSecure: true,
                    text: viewStore.binding(
                        get: \.password,
                        send: RegistrationFormFeature.Action.checkPasswordPattern
                    )
                )
                .padding(.top, 7)
                
                Text("비밀번호 확인")
                    .padding(.top, 25)
                    .padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                
                CustomTextField(
                    placeholder: "비밀번호를 다시 입력해주세요.",
                    isSecure: true,
                    text: viewStore.binding(
                        get: \.confirmPassword,
                        send: RegistrationFormFeature.Action.checkPasswordMatch
                    )
                )
                .padding(.top, 7)
            }
        }
    }
}

#Preview {
    RegistrationFormView(store: .init(initialState: .init(), reducer: {
        RegistrationFormFeature()._printChanges()
    }))
}
