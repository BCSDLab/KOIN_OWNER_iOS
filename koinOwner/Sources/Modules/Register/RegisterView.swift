//
//  RegisterView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/8/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var currentStep: Int = 1
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Group {
                        switch currentStep {
                        case 1: Text("1. 약관 동의")
                        case 2: Text("2. 기본 정보 입력")
                        default: Text("3. 사업자 인증")
                        }
                    }
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.main500)
                    
                    Spacer()
                    Text("\(currentStep) / 3")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(Color.main500)
                }
                CustomProgressBar(progress: Double(currentStep) / 3.0)
                    .frame(height: 8).padding(.top, 8)
                switch currentStep {
                case 1:
                    PolicyAgreementView(store: .init(initialState: .init(), reducer: {
                        PolicyAgreementFeature()._printChanges()
                    }))
                case 2:
                    RegistrationFormView()
                default:
                    BusinessVerificationView()
                }
                Spacer()
                Button(action: {
                    currentStep += 1
                }) {
                    Text("다음")
                        .font(.pretendard(.medium, size: 15))
                        .foregroundStyle(Color.neutral600)
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

#Preview {
    RegisterView()
}
