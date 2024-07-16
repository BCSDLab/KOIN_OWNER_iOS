//
//  MainView+MenuTab.swift
//  koinOwner
//
//  Created by 정영준 on 7/4/24.
//

import SwiftUI
import NukeUI

extension MainView {
    @MainActor
    func menuTab() -> some View {
        VStack(spacing: 0) {
            switch currentMenu {
            case -1:
                menuList(menus: Menu.recMock, type: .recommended)
                menuList(menus: Menu.mainMock, type: .main)
                menuList(menus: Menu.setMock, type: .set)
                menuList(menus: Menu.sideMock, type: .side)
            case 0:
                menuList(menus: Menu.recMock, type: .recommended)
            case 1:
                menuList(menus: Menu.mainMock, type: .main)
            case 2:
                menuList(menus: Menu.setMock, type: .set)
            case 3:
                menuList(menus: Menu.sideMock, type: .side)
            default:
                EmptyView()
            }
            
        }
    }
    
    @MainActor
    func menuRow(menu: Menu) -> some View {
        HStack(spacing: 0) {
            LazyImage(url: URL(string: "https://i.namu.wiki/i/I63sEiy-8vUXVhV-I0IZiS9ntT0INuKXgBYAE3QqUvOlToSoEqSgpvEbUmxsFTXtoBRN4WJolyAFEAlDdeZFhQ.webp")) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 68, height: 68)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } else {
                    RoundedRectangle(cornerRadius: 5) // TODO: placeholder 필요
                        .frame(width: 68, height: 68)
                        .foregroundStyle(Color.neutral100)
                }
            }
            .padding(.trailing, 16)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(menu.name)
                    .mediumText(16)
                    .lineLimit(2)
                Text("\(menu.price)원")
                    .regularText(14, color: Color.main500)
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 24)
    }
    
    @MainActor
    func menuList(menus: [Menu], type: MenuType) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if !menus.isEmpty {
                HStack(spacing: 8) {
                    Image(type.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                    Text(type.name)
                        .mediumText(18, color: Color.main400)
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 9)
                .padding(.top, 12)
                .padding(.leading, 16)
            }
            
            ForEach(Array(zip(menus, menus.indices)), id: \.0) { menu, index in
                
                menuRow(menu: menu)
                
                if index != menus.count - 1 {
                    Divider()
                        .foregroundStyle(Color.neutral200)
                        .padding(.horizontal, 24)
                } else {
                    Rectangle()
                        .frame(height: 6)
                        .foregroundStyle(Color.neutral100)
                }
            }
        }
    }
    
    func menuTypeButton(name: String, value: Int) -> some View {
        Button {
            withAnimation {
                if currentMenu == value {
                    currentMenu = -1
                } else {
                    currentMenu = value
                }
            }
        } label: {
            Text(name)
                .regularText(12, color: currentMenu == value ? Color.neutral0 : Color.neutral500)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(currentMenu == value ? Color.main500 : Color.neutral0)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(currentMenu == value ? Color.main500 : Color.neutral400)
                }
        }
    }
}

// 임시 Model. 재정의 예정
enum MenuType: Int, CaseIterable {
    case recommended = 0
    case main = 1
    case set = 2
    case side = 3
    
    var name: String {
        switch self {
        case .recommended:
            return "추천 메뉴"
        case .main:
            return "메인 메뉴"
        case .set:
            return "세트 메뉴"
        case .side:
            return "사이드 메뉴"
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .recommended:
            return .icnRecommendedMenu
        case .main:
            return .icnMainMenu
        case .set:
            return .icnSetMenu
        case .side:
            return .icnSideMenu
        }
    }
}

struct Menu: Hashable {
    var name: String
    var price: Int
    var type: [MenuType]
    
    static let mock: [Menu] = [
        Menu(name: "불족발 + 막국수 저녁 set", price: 25000, type: [.main, .recommended]),
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요 배고프다 진짜 맛있겠다아", price: 250000, type: [.main]),
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요", price: 250000, type: [.main]),
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요 배고프다 진짜 맛있겠다아", price: 250000, type: [.side, .recommended]),
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요 배고프다 진짜 맛있겠다아", price: 250000, type: [.side]),
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요 배고프다 진짜 맛있겠다아", price: 250000, type: [.set]),
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요 배고프다 진짜 맛있겠다아", price: 250000, type: [.set, .recommended])
    ]
    
    static let recMock: [Menu] = {
        return mock.filter { $0.type.contains(.recommended) }
    }()
    
    static let mainMock: [Menu] = {
        return mock.filter { $0.type.contains(.main) }
    }()
    
    static let setMock: [Menu] = {
        return mock.filter { $0.type.contains(.set) }
    }()
    
    static let sideMock: [Menu] = {
        return mock.filter { $0.type.contains(.side) }
    }()
}
