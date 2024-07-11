//
//  StoreRegisterView.swift
//  koinOwner
//
//  Created by 정영준 on 7/10/24.
//

import SwiftUI

struct StoreRegisterView: View {
    let registerType: StoreRegisterType
    @State var currentStep: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                switch currentStep {
                case 1: Text("1. 카테고리 설정")
                case 2: Text("2. 메인 정보 입력")
                case 3: Text("3. 세부 정보 입력")
                case 4: Text("2. 가게 정보 확인")
                default: EmptyView()
                }
                
                Spacer()
                
                Text("\(currentStep) / 4")
            }
            .font(.pretendard(.medium, size: 16))
            .foregroundStyle(Color.main500)
            .padding(.horizontal, 24)
       
            CustomProgressBar(progress: Double(currentStep) / 4.0)
                .padding(.top, 8)
                .padding(.bottom, 40)
                .padding(.horizontal, 24)
            
            Group {
                switch currentStep {
                case 1: CategorySelectView(currentStep: $currentStep)
                case 2: StoreMainInfoView(currentStep: $currentStep)
                case 3: StoreDetailInfoView(currentStep: $currentStep)
                case 4: StoreInfoConfirmView(currentStep: $currentStep)
                default: EmptyView()
                }
            }
        }
        .customNavigationBar(registerType.title, showBackButton: true, isColored: false)
    }
}

enum StoreRegisterType {
    case register
    case management
    
    var title: String {
        switch self {
        case .register:
            return "가게 등록"
        case .management:
            return "가게 관리"
        }
    }
}

#Preview {
    StoreRegisterView(registerType: .management)
}
