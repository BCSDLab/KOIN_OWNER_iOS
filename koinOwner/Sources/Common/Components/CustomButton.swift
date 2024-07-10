//
//  CustomButton.swift
//  koinOwner
//
//  Created by 정영준 on 7/10/24.
//

import SwiftUI

struct CustomButton<Label: View>: View {
    private let action: () -> Void
    private let label: Label
    private let width: CGFloat
    private let height: CGFloat
    private let isDisabled: Bool
    
    /// Width 지정 버튼
    public init(action: @escaping () -> Void, @ViewBuilder label: () -> Label, width: CGFloat = .infinity, height: CGFloat = 48, isDisabled: Bool = false) {
        self.action = action
        self.label = label()
        self.width = width
        self.height = height
        self.isDisabled = isDisabled
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            label
                .font(.pretendard(.medium, size: 15))
                .foregroundStyle(isDisabled ? Color.neutral600 : Color.neutral0)
                .frame(maxWidth: width, minHeight: height)
                .background(isDisabled ? Color.neutral300 : Color.main600)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
        .disabled(isDisabled)
    }
}