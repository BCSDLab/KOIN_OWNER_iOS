//
//  RegisterTab.swift
//  koinOwner
//
//  Created by 김나훈 on 8/19/24.
//

import Foundation

enum RegisterTab: Int, CaseIterable {
    case one = 1, two, three
    
    func next() -> RegisterTab {
        RegisterTab(rawValue: self.rawValue + 1) ?? self
    }
    
    var message: String {
        switch self {
        case .one: return "\(self.rawValue). 약관 동의"
        case .two: return "\(self.rawValue). 기본 정보 입력"
        case .three: return "\(self.rawValue). 사업자 인증"
        }
    }
}
