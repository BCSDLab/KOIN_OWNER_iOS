//
//  MainView.swift
//  koinOwner
//
//  Created by 정영준 on 7/3/24.
//

import SwiftUI
import NukeUI
import ScalingHeaderScrollView

struct MainView: View {
    @State var currentTab: Int = 0
    @State var currentMenu: Int = -1
    
    @State var progress: CGFloat = 0
    @State var currentOffset: CGFloat = 0
    private let minHeight = 56.0
    private let maxHeight = 364.0
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScalingHeaderScrollView {
                    headerView
                } content: {
                    storeInfoView
                        .padding(.bottom, 14)
                        .padding(.horizontal, 24)
                    
                    availableOptionRow(["배달", "카드", "계좌이체"])
                        .padding(.bottom, 44)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color.neutral400)
                            .padding(.trailing, 4)
                        
                        Text("2024.03.09 업데이트")
                            .font(.pretendard(.regular, size: 12))
                            .foregroundStyle(Color.neutral400)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 14)
                    
                    Rectangle()
                        .frame(height: 12)
                        .foregroundStyle(Color.neutral100)
                    
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        Section(header: tabBar(proxy: proxy)
                            .id("tabBar")
                            .background(Color.neutral0)
                        ) {
                            switch currentTab {
                            case 0:
                                menuTab()
                            case 1:
                                EmptyView()
                            default:
                                EmptyView()
                            }
                        }
                        
                    }
                    
                }
                .height(min: minHeight, max: maxHeight)
                .collapseProgress($progress)
                .scrollOffset($currentOffset)
            }
        }
        .mainNavigationBar()
    }
}

extension MainView {
    @MainActor
    var headerView: some View {
        VStack(alignment: .leading, spacing: 0) {
            LazyImage(url: URL(string: "https://i.namu.wiki/i/I63sEiy-8vUXVhV-I0IZiS9ntT0INuKXgBYAE3QqUvOlToSoEqSgpvEbUmxsFTXtoBRN4WJolyAFEAlDdeZFhQ.webp")) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 255)
                        .clipped()
                } else {
                    Rectangle() //TODO: placeholder 필요
                        .frame(width: .infinity, height: 255)
                        .foregroundStyle(Color.neutral100)
                }
            }
            .opacity(1 - progress)
            
            Button {
                ()
            } label: {
                HStack(spacing: 8) {
                    Spacer()
                    
                    Image(systemName: "gear") // TODO: 아이콘 추가
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(.vertical, 8)
                    
                    Text("가게 관리하기")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(Color.main500)
                    
                    Spacer()
                }
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.main600))
            }
            .opacity(1 - max(0, min(1, (progress - 0.75) * 4.0)))
            .disabled(progress > 0.75)
            .padding(.top, 16)
            .padding(.horizontal, 24)
            
            HStack(spacing: 0) {
                Text("가장 맛있는 족발") // MARK: 가게명
                    .font(.pretendard(.bold, size: 20))
                    .padding(.vertical, 14)
                
                
                Spacer()
                
                Button {
                    ()
                } label: {
                    Image(systemName: "gear") // TODO: 아이콘 추가
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 9)
                }
                .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.main600))
                .opacity(max(0, min(1, (progress - 0.75) * 4.0)))
                .disabled(progress <= 0.75)
            }
            .padding(.horizontal, 24)
        
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color.neutral300)
                .opacity(max(0, min(1, (progress - 0.75) * 4.0)))
        }
        .background(Color.neutral0)
    }
}

extension MainView {
    var storeInfoView: some View { // TODO: 가게 정보를 받아와 func으로 교체
        HStack(spacing: 19) {
            VStack(alignment: .leading, spacing: 7) {
                Text("전화번호")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral500)
                
                Text("운영시간")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral500)
                
                Text("휴무일")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral500)
                
                Text("주소정보")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral500)
                
                Text("배달금액")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral500)
                
                Text("기타 정보")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral500)
            }
            
            VStack(alignment: .leading, spacing: 7) {
                Text("041-523-5849")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral800)
                
                Text("16:00 ~ 00:00")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral800)
                
                Text("매주 화요일")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral800)
                
                Text("천안시 동남구 총절로 880 가동 1층")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral800)
                
                Text("0원")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral800)
                
                Text("3대째 다져온 고집스러운 맛")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.neutral800)
            }
            
            Spacer()
        }
    }
    
    func availableOptionView(_ option: String) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        Text("# \(option) 가능")
            .font(.pretendard(.regular, size: 12))
            .foregroundStyle(Color.main300)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.main300))
    }
    
    func availableOptionRow(_ options: [String]) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(options, id: \.self) { option in
                    availableOptionView(option)
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

extension MainView {
    func tabBar(proxy: ScrollViewProxy) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    currentTab = 0
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("tabBar", anchor: .top)
                    }
                } label: {
                    Text("메뉴")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(currentTab == 0 ? Color.main500 : Color.neutral500)
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.screenWidth / 2)
                }
                
                Button {
                    currentTab = 1
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("tabBar", anchor: .top)
                    }
                   
//                    snapTo = .custom(286)
                } label: {
                    Text("이벤트/공지")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(currentTab == 1 ? Color.main500 : Color.neutral500)
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.screenWidth / 2)
                }
            }
            
            Capsule()
                .frame(width: UIScreen.screenWidth / 2, height: 1.5)
                .foregroundStyle(Color.main500)
                .offset(x: CGFloat(currentTab) * (UIScreen.screenWidth / 2))
                .animation(.easeInOut, value: currentTab)
        }
        .frame(height: 46)
        .padding(.top, currentOffset >= 592 ?  min(62, currentOffset - 592) : 0)
    }
}

extension MainView {
    @MainActor
    func menuTab() -> some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(MenuType.allCases, id: \.self) { type in
                        menuTypeButton(name: type.name, value: type.rawValue)
                    }
                }
                .padding(.horizontal, 24)
            }
            
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
                    RoundedRectangle(cornerRadius: 5) //TODO: placeholder 필요
                        .frame(width: 68, height: 68)
                        .foregroundStyle(Color.neutral100)
                }
            }
            .padding(.trailing, 16)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(menu.name)
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.neutral800)
                    .lineLimit(2)
                Text("\(menu.price)원")
                    .font(.pretendard(.regular, size: 14))
                    .foregroundStyle(Color.main500)
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
                        .font(.pretendard(.medium, size: 18))
                        .foregroundStyle(Color.main400)
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
                .font(.pretendard(.regular, size: 12))
                .foregroundStyle(currentMenu == value ? Color.neutral0 : Color.neutral500)
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
        Menu(name: "불닭불족발 + 새콤달콤 비빔 막국수 저녁 요요 배고프다 진짜 맛있겠다아", price: 250000, type: [.main])]
    
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

#Preview {
    MainView()
}
