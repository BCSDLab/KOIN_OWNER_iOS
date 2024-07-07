//
//  CustomProgressBar.swift
//  koinOwner
//
//  Created by 김나훈 on 7/4/24.
//

import SwiftUI

struct CustomProgressBar: View {
    
    private let progress: Double

    init(progress: Double) {
        self.progress = progress
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 3)
                    .foregroundStyle(Color.neutral200)
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: geometry.size.width * CGFloat(progress), height: 3)
                    .foregroundStyle(Color.main500)
            }
        }
        .frame(height: 3)
    }
}
