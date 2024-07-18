//
//  CustomNavigationBar.swift
//  koinOwner
//
//  Created by 정영준 on 7/3/24.
//

import SwiftUI

struct CustomNavigationbarViewModifier<ButtonContent: View>: ViewModifier {
    let title: String
    let button: ButtonContent
    let showBackButton: Bool
    let isColored: Bool
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: title, button: button, showBackButton: showBackButton, isColored: isColored)
                .ignoresSafeArea(.keyboard)
            
            content
        }
        .onTapGesture {
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainNavigationbarViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            MainNavigationBar()
                .ignoresSafeArea(.keyboard)
            
            content
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func customNavigationBar<Content: View>(_ title: String = "", button: Content = EmptyView(), showBackButton: Bool = false, isColored: Bool = true) -> some View {
        self.modifier(CustomNavigationbarViewModifier(title: title, button: button, showBackButton: showBackButton, isColored: isColored))
    }

    func mainNavigationBar() -> some View {
        self.modifier(MainNavigationbarViewModifier())
    }
}

struct CustomNavigationBar<Content: View>: View {
    let title: String
    let button: Content
    let showBackButton: Bool
    let isColored: Bool

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                HStack(spacing: 0) {
                    Spacer()

                    Text(title)
                        .mediumText(18, color: isColored ? Color.neutral0 : Color.neutral800)
                        .lineLimit(1)
                    
                    Spacer()
                }
                HStack(spacing: 0) {
                    if showBackButton {
                        BackButton(isColored: isColored)
                    }
                
                    Spacer()
            
                    button
                }
                .padding(.horizontal, 16)
            }
        }
        .frame(height: 55)
        .background(isColored ? Color.main500 : Color.neutral0)
    }
}

struct MainNavigationBar: View {
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 9) {
                Image(.imgLogo)
                    .customImage(height: 30)
           
                Text("For Business")
                    .regularText(12, color: Color.neutral0)
            }
            
            Spacer()
            
            Button {
                () //TODO: 설명 View Navigation
            } label: {
                Image(.icnMenu)
                    .customImage(width: 24, height: 24)
                    .foregroundStyle(Color.neutral0)
            }

        }
        .padding(.horizontal, 16)
        .frame(height: 55)
        .background(Color.main500.ignoresSafeArea())
    }
}

struct BackButton: View {
    let isColored: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(isColored ? .icnChevronBackWhite : .icnChevronBackBlack)
                .customImage(width: 24, height: 24)
        }
    }
}

#Preview {
    CustomNavigationBar(title: "테스트", button: EmptyView(), showBackButton: true, isColored: false)
}
