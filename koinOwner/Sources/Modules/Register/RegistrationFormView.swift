//
//  RegistrationFormView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/4/24.
//

import SwiftUI

struct RegistrationFormView: View {
     @State private var phoneNumber: String = ""
     @State private var verificationCode: String = ""
     @State private var password: String = ""
     @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("2. 기본 정보 입력")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(Color.main500)
                    Spacer()
                    Text("2 / 3")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(Color.main500)
                }
                CustomProgressBar(progress: 0.66)
                    .frame(height: 8).padding(.top, 8)
                Text("아이디").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                HStack {
                    CustomTextField(placeholder: "- 없이 번호를 입력해주세요.", text: $phoneNumber)
                        .padding(.top, 7)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("인증번호 발송")
                            .frame(width: 106, height: 41)
                            .font(.pretendard(.medium, size: 15))
                            .foregroundStyle(Color.neutral0)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                Text("인증번호").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                CustomTextField(placeholder: "인증번호를 입력해주세요.", text: $verificationCode)
                    .padding(.top, 7)
                Text("비밀번호").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                CustomTextField(placeholder: "비밀번호를 입력해주세요.", isSecure: true, text: $password)
                    .padding(.top, 7)
                Text("비밀번호 확인").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                CustomTextField(placeholder: "비밀번호를 다시 입력해주세요.", isSecure: true, text: $confirmPassword)
                    .padding(.top, 7)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("다음")
                        .font(.pretendard(.medium, size: 15))
                        .foregroundStyle(Color.neutral600)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.neutral300)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .padding(.bottom, 10)
            }
            .padding(.top, 16).padding(.horizontal, 16)
                .navigationTitle("회원가입")
                .navigationBarTitleDisplayMode(.inline)
        }
    
    }
}

#Preview {
    RegistrationFormView()
}
