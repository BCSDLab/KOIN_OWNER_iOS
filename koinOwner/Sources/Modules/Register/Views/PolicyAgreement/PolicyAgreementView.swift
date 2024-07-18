//
//  PolicyAgreementView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/4/24.
//

import ComposableArchitecture
import SwiftUI

struct PolicyAgreementView: View {
    
    private let store: StoreOf<PolicyAgreementFeature>
    
    init(store: StoreOf<PolicyAgreementFeature>) {
        self.store = store
    }
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<PolicyAgreementFeature.State, PolicyAgreementFeature.Action>) in
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        viewStore.send(.agreeAllButtonTapped)
                    }) {
                        Image(viewStore.isAgreeAllButtonToggled ? "on_small_select" : "off_small_select").resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }.padding(.leading, 12)
                    Text("모두 동의합니다.")
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color(.main500))
                    Spacer()
                }.frame(maxWidth: .infinity, minHeight: 40).background(Color.neutral100).padding(.top, 9)
                HStack {
                    Button(action: {
                        viewStore.send(.personalInformationButtonTapped)
                    }) {
                        Image(viewStore.isPersonalInformationButtonToggled ? "on_small_select" : "off_small_select").resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }.padding(.leading, 12)
                    Text("개인정보 이용약관 (필수)")
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color(.neutral500))
                    Spacer()
                }.padding(.vertical, 16)
                ScrollView {
                    Text(AgreementText.personalInformation.description).font(.pretendard(.regular, size: 10)).padding(12).lineSpacing(6)
                }.frame(maxWidth: .infinity, maxHeight: 168).background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundStyle(.neutral500)
                )
                HStack {
                    Button(action: {
                        viewStore.send(.koinButtonTapped)
                    }) {
                        Image(viewStore.isKoinButtonToggled ? "on_small_select" : "off_small_select").resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }.padding(.leading, 12)
                    Text("코인 이용약관 (필수)")
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color(.neutral500))
                    Spacer()
                }.padding(.vertical, 16)
                ScrollView {
                    Text(AgreementText.koin.description).font(.pretendard(.regular, size: 10)).padding(12).lineSpacing(6)
                }.frame(maxWidth: .infinity, maxHeight: 168).background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundStyle(.neutral500)
                )
            }
        }
    }
}

#Preview {
    PolicyAgreementView(store: .init(initialState: .init(), reducer: {
        PolicyAgreementFeature()._printChanges()
    }))
}
