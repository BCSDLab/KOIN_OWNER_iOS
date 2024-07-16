//
//  View+TextModifier.swift
//  koinOwner
//
//  Created by 정영준 on 7/16/24.
//

import SwiftUI

struct TextFieldTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.pretendard(.medium, size: 14))
            .foregroundStyle(Color(.neutral800))
    }
}

struct ProgressBarTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.pretendard(.medium, size: 16))
            .foregroundStyle(Color.main500)
    }
}

struct RegularText: ViewModifier {
    let size: CGFloat
    let color: Color
    
    init(size: CGFloat, color: Color) {
        self.size = size
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .font(.pretendard(.regular, size: size))
            .foregroundStyle(color)
    }
}

struct MediumText: ViewModifier {
    let size: CGFloat
    let color: Color
    
    init(size: CGFloat, color: Color) {
        self.size = size
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .font(.pretendard(.medium, size: size))
            .foregroundStyle(color)
    }
}

struct BoldText: ViewModifier {
    let size: CGFloat
    let color: Color
    
    init(size: CGFloat, color: Color) {
        self.size = size
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .font(.pretendard(.bold, size: size))
            .foregroundStyle(color)
    }
}

extension View {
    func textFieldTitle() -> some View {
        self.modifier(TextFieldTitle())
    }
    
    func progressBarTitle() -> some View {
        self.modifier(ProgressBarTitle())
    }
    
    func regularText(_ size: CGFloat, color: Color = Color.neutral800) -> some View {
        self.modifier(RegularText(size: size, color: color))
    }
    
    func mediumText(_ size: CGFloat, color: Color = Color.neutral800) -> some View {
        self.modifier(MediumText(size: size, color: color))
    }
    
    func boldText(_ size: CGFloat, color: Color = Color.neutral800) -> some View {
        self.modifier(BoldText(size: size, color: color))
    }
}
