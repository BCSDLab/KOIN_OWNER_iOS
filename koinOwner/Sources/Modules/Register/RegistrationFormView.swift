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
        VStack(alignment: .leading, spacing: 0) {
                Text("아이디").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
            
                HStack {
                    CustomTextField(placeholder: "- 없이 번호를 입력해주세요.", text: $phoneNumber)
                        .padding(.top, 7)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("인증번호 발송")
                            .mediumText(15, color: Color.neutral0)
                            .frame(width: 106, height: 41)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                Text("인증번호").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
            
                CustomTextField(placeholder: "인증번호를 입력해주세요.", text: $verificationCode)
                    .padding(.top, 7)
            
                Text("비밀번호").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
            
                CustomTextField(placeholder: "비밀번호를 입력해주세요.", isSecure: true, text: $password)
                    .padding(.top, 7)
            
                Text("비밀번호 확인").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
            
                CustomTextField(placeholder: "비밀번호를 다시 입력해주세요.", isSecure: true, text: $confirmPassword)
                    .padding(.top, 7)
        }
    
    }
}

#Preview {
    RegistrationFormView()
}
