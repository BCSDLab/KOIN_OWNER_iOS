//
//  ShopRegisterSuccessView.swift
//  koinOwner
//
//  Created by 정영준 on 7/11/24.
//

import SwiftUI

struct ShopRegisterSuccessView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image(.imgCheckCircle)
                .customImage(width: 55, height: 55)
                .padding(.bottom, 24)
            
            Text("가게 등록 완료")
                .mediumText(24, color: Color.main500)
                .padding(.bottom, 16)
            
            Text("가게 등록이 완료되었습니다.\n업체 정보 수정은 내 상점에서 가능합니다.")
                .regularText(16, color: Color.neutral500)
                .multilineTextAlignment(.center)
                .padding(.bottom, 56)
            
            CustomButton {
                ()
            } label: {
                Text("메인 화면 바로가기")
            }
            .padding(.horizontal, 24)

            Spacer()
        }
    }
}

#Preview {
    ShopRegisterSuccessView()
}
