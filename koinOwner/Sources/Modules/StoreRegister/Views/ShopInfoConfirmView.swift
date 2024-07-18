//
//  ShopInfoConfirmView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI

struct ShopInfoConfirmView: View {
    @Binding var currentStep: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("가장 맛있는 족발") // MARK: 가게명
                .boldText(20)
                .padding(.bottom, 24)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    Text("카테고리")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("족발")
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("주소정보")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("천안시 동남구 총절로 880 가동 1층")
                        .regularText(16)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("전화번호")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                
                    Text("041-523-5849")
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("배달금액")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("0원")
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("운영시간")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("16:00 ~ 00:00")
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(alignment: .top, spacing: 12) {
                    Text("휴무일")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("매주 화요일")
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(alignment: .top, spacing: 12) {
                    Text("기타정보")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("3대째 다져온 고집스러운 맛 3대째 다져온 고집스러운 맛 3대째 다져온 고집스러운 맛")
                        .regularText(16)
                    
                    Spacer()
                }
            }
            .padding(.bottom, 16)
            
            availableOptionRow(["카드", "계좌이체"])
            
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
                    ()
                } label: {
                    Text("등록")
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

extension ShopInfoConfirmView {
    func availableOptionView(_ option: String) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        Text("# \(option) 가능")
            .regularText(12, color: Color.main300)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.main300))
    }
    
    func availableOptionRow(_ options: [String]) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(options, id: \.self) { option in
                    availableOptionView(option)
                }
            }
        }
    }
}

#Preview {
    ShopInfoConfirmView(currentStep: .constant(4))
}
