//
//  ChangePasswordView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/9/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                Text("새 비밀번호").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                    CustomTextField(placeholder: "새 비밀번호를 입력해주세요..", text: $password)
                        .padding(.top, 7)
                Text("비밀번호 확인").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
   
                CustomTextField(placeholder: "새 비밀번호를 다시 입력해주세요.", text: $confirmPassword)
                    .padding(.top, 7)
          
            Spacer()
        }
    }
}

#Preview {
    ChangePasswordView()
}
