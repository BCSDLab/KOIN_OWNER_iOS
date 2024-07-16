//
//  BusinessVerificationView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/5/24.
//

import ComposableArchitecture
import SwiftUI

struct BusinessVerificationView: View {
    let store: StoreOf<BusinessVerificationFeature>
    
    init(store: StoreOf<BusinessVerificationFeature>) {
        self.store = store
    }
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<BusinessVerificationFeature.State, BusinessVerificationFeature.Action>) in
            VStack(alignment: .leading, spacing: 0) {
                Text("대표자명(실명)").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                CustomTextField(placeholder: "이름을 입력해주세요.", 
                                text: Binding(
                                    get: { viewStore.ownerName },
                                    set: { _ in }
                                ))
                    .padding(.top, 7)
                Text("가게명").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                
                HStack {
                    CustomTextField(placeholder: "가게명을 입력해주세요.", text: Binding(
                        get: { viewStore.shopName },
                        set: { _ in }
                    ))
                    .padding(.top, 7)
                    
                    Spacer()
                    
                    Button(action: {
                        viewStore.send(.searchShopButtonTapped)
                    }) {
                        Text("가게 검색")
                            .frame(width: 106, height: 41)
                            .font(.pretendard(.medium, size: 15))
                            .foregroundStyle(Color.neutral0)
                            .background(Color.main500)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                    .padding(.top, 7)
                Text("사업자 등록번호").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                CustomTextField(placeholder: "숫자만 입력해주세요.", text: Binding(
                    get: { viewStore.businessRegistrationNumber },
                    set: { _ in }
                ))
                    .padding(.top, 7)
                Text("사업자 인증 파일").padding(.top, 25).padding(.leading, 8)
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color(.neutral800))
                HStack {
                    Text("사업자 등록증, 영업신고증, 통장사본을 첨부하세요.").padding(.leading, 8)
                        .font(.pretendard(.regular, size: 12)).foregroundStyle(Color.neutral500)
                    Spacer()
                    Text("0/5").font(.pretendard(.regular, size: 12)).foregroundStyle(Color.neutral500)
                }.padding(.top, 4)
                Button(action: {
                    viewStore.send(.addFileButtonTapped)
                }) {
                    HStack {
                        Image("icn_add_file").resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20).padding(.leading, 8)
                        Text("파일 첨부")
                            .font(.pretendard(.medium, size: 14))
                        
                    } .foregroundStyle(Color.neutral600)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.neutral100)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                }.padding(.top, 5)
            }
        }
    }
}

#Preview {
    BusinessVerificationView(store: .init(initialState: .init(), reducer: {
        BusinessVerificationFeature()._printChanges()
    }))
}
