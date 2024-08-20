//
//  ShopsDTO.swift
//  koinOwner
//
//  Created by 김나훈 on 8/20/24.
//

import Foundation

struct ShopsDTO: Decodable {
    let count: Int
    let shops: [ShopDTO]
}

struct ShopDTO: Decodable {
    let id: Int
    let name: String
    let payBank: Bool
    let payCard: Bool
    let delivery: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name, delivery
        case payBank = "pay_bank"
        case payCard = "pay_card"
    }
}
