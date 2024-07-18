//
//  Image+Custom.swift
//  koinOwner
//
//  Created by 정영준 on 7/16/24.
//

import SwiftUI

extension Image {
    @ViewBuilder
    func customImage(_ scale: ImageScale = .fit, width: CGFloat = .nan, height: CGFloat = .nan, cornerRadius: CGFloat = 0) -> some View {
        if scale == .fit {
            self
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        } else {
            self
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        }
    }
}

enum ImageScale {
    case fit
    case fill
}
