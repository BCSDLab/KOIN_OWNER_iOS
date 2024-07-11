//
//  StoreMainInfoView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI

struct StoreMainInfoView: View {
    @Binding var currentStep: Int
    @State var storeName: String = ""
    @State var address: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                ()
            } label: {
                VStack(spacing: 0) {
                    Image(.imgSpoonFork)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .padding(.bottom, 8)
                    
                    Text("영역을 선택하여 이미지를 추가하세요.")
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color.neutral500)
                }
                .padding(.vertical, 54)
                .padding(.horizontal, 38)
                .background(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1).foregroundStyle(Color.neutral500))
            }
            .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("가게명")
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                    .padding(.leading, 8)
                    .padding(.bottom, 7)
                
                HStack(spacing: 16) {
                    CustomTextField(placeholder: "가게명을 입력하세요.", text: $storeName)
                    
                    Button {
                        ()
                    } label: {
                        Text("가게 검색")
                            .font(.pretendard(.medium, size: 15))
                            .foregroundStyle(Color.neutral0)
                            .frame(height: 46)
                            .padding(.horizontal, 16)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                .padding(.bottom, 24)
                
                Text("주소정보")
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                    .padding(.leading, 8)
                    .padding(.bottom, 7)
                
                CustomTextField(placeholder: "주소를 입력하세요.", text: $address)
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            HStack(spacing: 12) {
                CustomSubButton {
                    withAnimation {
                        currentStep -= 1
                    }
                } label: {
                    Text("이전")
                }
                .frame(width: UIScreen.screenWidth / 4)
                
                CustomButton {
                    withAnimation {
                        currentStep += 1
                    }
                } label: {
                    Text("다음")
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    StoreMainInfoView(currentStep: .constant(2))
}
