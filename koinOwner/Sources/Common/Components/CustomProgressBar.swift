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
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 3)
                    .foregroundStyle(Color.neutral200)
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: UIScreen.main.bounds.width * CGFloat(progress), height: 3)
                    .foregroundStyle(Color.main500)
            }
        .frame(height: 3)
    }
}
