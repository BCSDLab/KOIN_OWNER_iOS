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
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            BaseNavigationBar(title, button: button, showBackButton: showBackButton)
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
    func customNavigationBar<Content: View>(_ title: String = "", button: Content = EmptyView(), showBackButton: Bool = false) -> some View {
        self.modifier(CustomNavigationbarViewModifier(title: title, button: button, showBackButton: showBackButton))
    }

    func mainNavigationBar() -> some View {
        self.modifier(MainNavigationbarViewModifier())
    }
}

struct BaseNavigationBar<Content: View>: View {
    let title: String
    let button: Content
    let showBackButton: Bool

    init(_ title: String = "", button: Content, showBackButton: Bool) {
        self.title = title
        self.button = button
        self.showBackButton = showBackButton
    }

    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                HStack(spacing: 0) {
                    Spacer()

                    Text(title)
                        .font(.pretendard(.medium, size: 18))
                        .foregroundStyle(Color.neutral0)
                        .lineLimit(1)
                    
                    Spacer()
                }
                HStack(spacing: 0) {
                    if showBackButton {
                        BackButton()
                    }
                
                    Spacer()
            
                    button
                }
                .padding(.horizontal, 16)
            }
        }
        .frame(height: 55)
        .background(Color.main500)
    }
}

struct MainNavigationBar: View {
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: 9) {
                Image(.imgLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                
                Text("For Business")
                    .font(.pretendard(.regular, size: 12))
                    .foregroundStyle(Color.neutral0)
            }
            
            Spacer()
            
            Button {
                () //TODO: 설명 View Navigation
            } label: {
                Image(.icnMenu)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.neutral0)
            }

        }
        .padding(.horizontal, 16)
        .frame(height: 55)
        .background(Color.main500.ignoresSafeArea())
    }
}

struct BackButton: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left") //TODO: 이미지 넣어야함
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
    }
}

// Swipe to dismiss 기능 활성화.
extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

#Preview {
    MainNavigationBar()
}
