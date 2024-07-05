//
//  CustomTextField.swift
//  koinOwner
//
//  Created by 김나훈 on 7/4/24.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    var isSecure: Bool
    @Binding var text: String

    init(placeholder: String, isSecure: Bool = false, text: Binding<String>) {
        self.placeholder = placeholder
        self.isSecure = isSecure
        self._text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .padding(16)
            .frame(height: 46)
            .background(Color(.neutral100))
            .cornerRadius(4)
            .foregroundColor(Color.neutral800)
       }
    }
}
