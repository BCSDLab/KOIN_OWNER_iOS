//
//  ShopRegisterEntryView.swift
//  koinOwner
//
//  Created by 정영준 on 7/10/24.
//

import SwiftUI

struct ShopRegisterEntryView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image(.imgEnterInfo)
                .customImage(width: 55, height: 55)
                .padding(.bottom, 38)
            
            Text("가게 정보 기입")
                .boldText(24, color: Color.main500)
                .padding(.bottom, 20)

            Text("가게의 다양한 정보를 입력 및 수정하여 학생들에게 최신 가게 정보를 알려주세요.")
                .regularText(16, color: Color.neutral500)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 53)
                .padding(.bottom, 55)
            
            CustomButton {
                ()
            } label: {
                Text("가게 정보 기입")
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .customNavigationBar(showBackButton: true, isColored: false)

    }
}

#Preview {
    ShopRegisterEntryView()
}
