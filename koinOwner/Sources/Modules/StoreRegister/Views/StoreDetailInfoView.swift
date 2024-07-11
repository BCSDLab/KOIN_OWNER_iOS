//
//  StoreDetailInfoView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI

struct StoreDetailInfoView: View {
    @Binding var currentStep: Int
    @State var phoneNumber: String = ""
    @State var delivery: String = ""
    @State var otherInfo: String = ""
    @State var isDeliveryAvailable: Bool = false
    @State var isCardAvailable: Bool = false
    @State var isAccountAvailable: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("전화번호")
                .font(.pretendard(.medium, size: 14))
                .foregroundStyle(Color(.neutral800))
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "전화번호를 입력하세요.", text: $phoneNumber)
                .padding(.bottom, 24)
            
            Text("배달금액")
                .font(.pretendard(.medium, size: 14))
                .foregroundStyle(Color(.neutral800))
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "배달금액을 입력하세요.", text: $delivery)
                .padding(.bottom, 24)
            
            Text("운영시간")
                .font(.pretendard(.medium, size: 14))
                .foregroundStyle(Color(.neutral800))
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            HStack(spacing: 16) {
                Text("00:00 ~ 24:00")
                    .font(.pretendard(.regular, size: 18))
                    .foregroundStyle(Color.neutral500)
                
                Spacer()
                
                Button {
                    ()
                } label: {
                    Text("시간수정")
                        .font(.pretendard(.medium, size: 15))
                        .foregroundStyle(Color.neutral0)
                        .frame(height: 46)
                        .padding(.horizontal, 16)
                        .background(Color.main500)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            .padding(.bottom, 24)
            
            Text("기타정보")
                .font(.pretendard(.medium, size: 14))
                .foregroundStyle(Color(.neutral800))
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "기타정보를 입력하세요.", text: $otherInfo)
                .padding(.bottom, 34)
            
            HStack(spacing: 24) {
                Button {
                    isDeliveryAvailable.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(isDeliveryAvailable ? .btnToggleOn : .btnToggleOff)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("배달 가능")
                            .font(.pretendard(.medium, size: 14))
                            .foregroundStyle(isDeliveryAvailable ? Color.sub500 : Color.neutral500)
                    }
                }

                Button {
                    isCardAvailable.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(isCardAvailable ? .btnToggleOn : .btnToggleOff)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("카드 가능")
                            .font(.pretendard(.medium, size: 14))
                            .foregroundStyle(isCardAvailable ? Color.sub500 : Color.neutral500)
                    }
                }
                
                Button {
                    isAccountAvailable.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(isAccountAvailable ? .btnToggleOn : .btnToggleOff)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("계좌이체 가능")
                            .font(.pretendard(.medium, size: 14))
                            .foregroundStyle(isAccountAvailable ? Color.sub500 : Color.neutral500)
                    }
                }
            }
            
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
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    StoreDetailInfoView(currentStep: .constant(3))
}
