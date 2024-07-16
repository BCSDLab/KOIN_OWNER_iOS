//
//  PolicyAgreementView.swift
//  koinOwner
//
//  Created by 김나훈 on 7/4/24.
//

import SwiftUI

struct PolicyAgreementView: View {
    
    @State private var isAgreeAllButtonToggled = false
    @State private var isPersonalInformationButtonToggled = false
    @State private var isKoinButtonToggled = false
    
    var body: some View {
            VStack(spacing: 0) {
    
                HStack {
                    Button(action: {
                        isAgreeAllButtonToggled.toggle()
                        isPersonalInformationButtonToggled = isAgreeAllButtonToggled
                        isKoinButtonToggled = isAgreeAllButtonToggled
                    }) {
                        Image(isAgreeAllButtonToggled ? "on_small_select" : "off_small_select").resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }.padding(.leading, 12)
                    Text("모두 동의합니다.")
                        .mediumText(14, color: Color.main500)
                    
                    Spacer()
                }.frame(maxWidth: .infinity, minHeight: 40).background(Color.neutral100).padding(.top, 9)
                HStack {
                    Button(action: {
                        isPersonalInformationButtonToggled.toggle()
                    }) {
                        Image(isPersonalInformationButtonToggled ? "on_small_select" : "off_small_select").resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }.padding(.leading, 12)
                    Text("개인정보 이용약관 (필수)")
                        .mediumText(14, color: Color.neutral500)
                    Spacer()
                }.padding(.vertical, 16)
                ScrollView {
                    Text(AgreementText.personalInformation.description)
                        .regularText(10)
                        .padding(12).lineSpacing(6)
                }.frame(maxWidth: .infinity, maxHeight: 168).background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundStyle(.neutral500)
                )
                HStack {
                    Button(action: {
                        isKoinButtonToggled.toggle()
                    }) {
                        Image(isKoinButtonToggled ? "on_small_select" : "off_small_select").resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }.padding(.leading, 12)
                    Text("코인 이용약관 (필수)")
                        .mediumText(14, color: Color.neutral500)
                    Spacer()
                }.padding(.vertical, 16)
                ScrollView {
                    Text(AgreementText.koin.description)
                        .regularText(10)
                        .padding(12).lineSpacing(6)
                }.frame(maxWidth: .infinity, maxHeight: 168).background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundStyle(.neutral500)
                )
           
        }
    }
}

#Preview {
    PolicyAgreementView()
}
