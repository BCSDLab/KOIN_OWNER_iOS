//
//  ShopInfoConfirmView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI

extension ShopRegisterView {
    var shopInfoConfirmView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewStore.state.shopMainInfo.shopName) // MARK: 가게명
                .boldText(20)
                .padding(.bottom, 24)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    Text("카테고리")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text(viewStore.state.categorySelect.selectedCategory.title)
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("주소정보")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text(viewStore.state.shopMainInfo.address)
                        .regularText(16)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("전화번호")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text(viewStore.state.shopDetailInfo.phoneNumber)
                        .regularText(16)
                    
                    Spacer()
                }
                
                HStack(spacing: 12) {
                    Text("배달금액")
                        .regularText(16, color: Color.neutral500)
                        .frame(width: 64, alignment: .leading)
                    
                    Text("\(viewStore.state.shopDetailInfo.deliveryFee)원")
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
                    
                    Text(viewStore.state.shopDetailInfo.otherInfo)
                        .regularText(16)
                    
                    Spacer()
                }
            }
            .padding(.bottom, 16)
            
            availableOptionRow(viewStore.state.shopDetailInfo.availableOptions)
            
            Spacer()
            
        }
        .padding(.horizontal, 24)
    }
}

extension ShopRegisterView {
    func availableOptionView(_ option: String) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        Text("# \(option) 가능")
            .regularText(12, color: Color.main300)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.main300))
    }
    
    func availableOptionRow(_ options: [Bool]) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(Array(zip(options.indices, options)), id: \.0) { index, option in
                    if option {
                        availableOptionView(AvailableOptions.init(rawValue: index)?.title ?? "")
                    }
                }
            }
        }
    }
}
