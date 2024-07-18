//
//  ShopDetailInfoView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI

struct ShopDetailInfoView: View {
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
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "전화번호를 입력하세요.", text: $phoneNumber)
                .padding(.bottom, 24)
            
            Text("배달금액")
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            CustomTextField(placeholder: "배달금액을 입력하세요.", text: $delivery)
                .padding(.bottom, 24)
            
            Text("운영시간")
                .textFieldTitle()
                .padding(.leading, 8)
                .padding(.bottom, 7)
            
            HStack(spacing: 16) {
                Text("00:00 ~ 24:00")
                    .regularText(18, color: Color.neutral500)
                
                Spacer()
                
                CustomButton(action: {
                    ()
                }, label: {
                    Text("시간수정")
                }, width: 84, height: 46)
                
            }
            .padding(.bottom, 24)
            
            Text("기타정보")
                .textFieldTitle()
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
                            .customImage(width: 16, height: 16)
                        
                        Text("배달 가능")
                            .mediumText(14, color: isDeliveryAvailable ? Color.sub500 : Color.neutral500)
                    }
                }

                Button {
                    isCardAvailable.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(isCardAvailable ? .btnToggleOn : .btnToggleOff)
                            .customImage(width: 16, height: 16)
                        
                        Text("카드 가능")
                            .mediumText(14, color: isDeliveryAvailable ? Color.sub500 : Color.neutral500)
                    }
                }
                
                Button {
                    isAccountAvailable.toggle()
                } label: {
                    HStack(spacing: 8) {
                        Image(isAccountAvailable ? .btnToggleOn : .btnToggleOff)
                            .customImage(width: 16, height: 16)
                        
                        Text("계좌이체 가능")
                            .mediumText(14, color: isDeliveryAvailable ? Color.sub500 : Color.neutral500)
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
    ShopDetailInfoView(currentStep: .constant(3))
}
