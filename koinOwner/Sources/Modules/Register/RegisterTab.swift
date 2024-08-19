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
}
