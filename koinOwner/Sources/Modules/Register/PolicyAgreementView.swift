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
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("1. 약관 동의")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(Color.main500)
                    Spacer()
                    Text("1 / 3")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(Color.main500)
                }
                CustomProgressBar(progress: 0.33)
                    .frame(height: 8).padding(.top, 8)
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
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color(.main500))
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
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color(.neutral500))
                    Spacer()
                }.padding(.top, 16).padding(.bottom, 16)
                ScrollView {
                    Text(AgreementText.personalInformation.description).font(.pretendard(.regular, size: 10)).padding(12).lineSpacing(6)
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
                        .font(.pretendard(.medium, size: 14))
                        .foregroundStyle(Color(.neutral500))
                    Spacer()
                }.padding(.top, 16).padding(.bottom, 16)
                ScrollView {
                    Text(AgreementText.koin.description).font(.pretendard(.regular, size: 10)).padding(12).lineSpacing(6)
                }.frame(maxWidth: .infinity, maxHeight: 168).background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundStyle(.neutral500)
                )
                
                Spacer()
                Button(action: {
                    
                }) {
                    Text("다음")
                        .font(.pretendard(.medium, size: 15))
                        .foregroundStyle(isKoinButtonToggled && isPersonalInformationButtonToggled ? Color.neutral0 : Color.neutral600)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(isKoinButtonToggled && isPersonalInformationButtonToggled ? Color.main500 : Color.neutral300)
                        .cornerRadius(4)
                }
                .padding(.bottom, 10)
            }.padding(.top, 16).padding(.leading, 16).padding(.trailing, 16)
                .navigationTitle("회원가입")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PolicyAgreementView()
}
