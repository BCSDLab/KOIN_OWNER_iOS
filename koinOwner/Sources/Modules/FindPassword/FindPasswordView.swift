//
//  FindPasswordView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/9/24.
//

import SwiftUI

struct FindPasswordView: View {
    @State private var currentStep: Int = 1
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Group {
                        switch currentStep {
                        case 1: Text("1. 계정 인증")
                        default: Text("2. 비밀번호 변경")
                        }
                    }
                  
                    
                    Spacer()
                    Text("\(currentStep) / 2")
                }
                .progressBarTitle()
                
                CustomProgressBar(progress: Double(currentStep) / 2.0)
                    .frame(height: 8).padding(.top, 8)
                switch currentStep {
                case 1:
                    AccountVerificationView()
                default:
                    ChangePasswordView()
                }
                Spacer()
                Button(action: {
                    currentStep += 1
                }) {
                    Text("다음")
                        .mediumText(15, color: Color.neutral600)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.neutral300)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .padding(.bottom, 10)
            }.padding(.top, 16).padding(.horizontal, 16)
                .navigationTitle("비밀번호 찾기")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}
#Preview {
    FindPasswordView()
}
