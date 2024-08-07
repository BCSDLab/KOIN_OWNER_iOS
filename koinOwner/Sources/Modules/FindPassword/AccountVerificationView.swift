//
//  AccountVerificationView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/9/24.
//

import SwiftUI

struct AccountVerificationView: View {
    @State private var phoneNumber: String = ""
    @State private var verificationCode: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                Text("휴대폰 번호").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
            
                    CustomTextField(placeholder: "- 없이 번호를 입력해주세요.", text: $phoneNumber)
                        .padding(.top, 7)
            
                Text("인증번호").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
            
            HStack {
                CustomTextField(placeholder: "인증번호를 입력해주세요.", text: $verificationCode)
                    .padding(.top, 7)
                Button(action: {
                    
                }) {
                    Text("인증번호 발송")
                        .mediumText(15, color: Color.neutral0)
                        .frame(width: 106, height: 41)
                        .background(Color.main500)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            Spacer()
        }
    
    }
}

#Preview {
    AccountVerificationView()
}
