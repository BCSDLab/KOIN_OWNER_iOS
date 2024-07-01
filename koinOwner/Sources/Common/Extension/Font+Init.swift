//
//  Font+Init.swift
//  koinOwner
//
//  Created by 정영준 on 7/1/24.
//

import SwiftUI

extension Font {
    enum Pretendard {
        case regular
        case medium
        case bold
        
        var value: String {
            switch self {
            case .regular:
                return "Pretendard-Regular"
            case .medium:
                return "Pretendard-Medium"
            case .bold:
                return "Pretendard-Bold"
            }
        }
    }

    static func pretendard(_ type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.value, size: size)     // ex) .font(.pretendard(.bold, size: 19))
    }
}
