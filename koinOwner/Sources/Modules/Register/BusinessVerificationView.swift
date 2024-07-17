//
//  BusinessVerificationView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/5/24.
//

import SwiftUI

struct BusinessVerificationView: View {
    @State private var ownerName: String = ""
    @State private var shopName: String = ""
    @State private var businessRegistrationNumber: String = ""
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("대표자명(실명)").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
                
                CustomTextField(placeholder: "이름을 입력해주세요.", text: $ownerName)
                    .padding(.top, 7)
                
                Text("가게명").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
                
                CustomTextField(placeholder: "가게명을 입력해주세요.", text: $shopName)
                    .padding(.top, 7)
                
                Text("사업자 등록번호").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
                
                CustomTextField(placeholder: "숫자만 입력해주세요.", text: $businessRegistrationNumber)
                    .padding(.top, 7)
                
                Text("사업자 인증 파일").padding(.top, 25).padding(.leading, 8)
                    .textFieldTitle()
                
                HStack {
                    Text("사업자 등록증, 영업신고증, 통장사본을 첨부하세요.").padding(.leading, 8)
                        .regularText(12, color: Color.neutral500)
                    Spacer()
                    Text("0/5")
                        .regularText(12, color: Color.neutral500)
    
                }.padding(.top, 4)
                Button(action: {
                    
                }) {
                    HStack {
                        Image("icn_add_file").resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20).padding(.leading, 8)
                        Text("파일 첨부")
                            .mediumText(14)
                        
                    } .foregroundStyle(Color.neutral600)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.neutral100)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                }.padding(.top, 5)
        }
    }
}

#Preview {
    BusinessVerificationView()
}