//
//  Font+Custom.swift
//  koinOwner
//
//  Created by 정영준 on 7/1/24.
//

import SwiftUI

extension Font {
    enum Pretendard: String {
        case regular = "Pretendard-Regular"
        case medium = "Pretendard-Medium"
        case bold = "Pretendard-Bold"
    }

    static func pretendard(_ type: Pretendard, size: CGFloat) -> Font {
        return .custom(type.rawValue, size: size)
    }
}
