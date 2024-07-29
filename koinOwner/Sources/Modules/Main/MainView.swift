//
//  MainView.swift
//  koinOwner
//
//  Created by 정영준 on 7/3/24.
//

import SwiftUI
import NukeUI
import ScalingHeaderScrollView
import ComposableArchitecture

struct MainView: View {
    let store: StoreOf<MainFeature>
    
    @State var progress: CGFloat = 0
    @State var currentOffset: CGFloat = 0
    private let minHeight = 56.0
    private let maxHeight = 364.0
    
    init(store: StoreOf<MainFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { (viewStore: ViewStore<MainFeature.State, MainFeature.Action>) in
            VStack(spacing: 0) {
                ScrollViewReader { proxy in
                    ScalingHeaderScrollView {
                        headerView
                    } content: {
                        shopInfoView
                            .padding(.bottom, 14)
                            .padding(.horizontal, 24)
                        
                        availableOptionRow(["배달", "카드", "계좌이체"])
                            .padding(.bottom, 44)
                        
                        HStack(spacing: 0) {
                            Image(.icnInfo)
                                .customImage(width: 16, height: 16)
                                .padding(.trailing, 4)
                            
                            Text("2024.03.09 업데이트")
                                .regularText(12, color: Color.neutral400)
                            
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
                                switch viewStore.state.currentTab {
                                case 0:
                                    menuTab()
                                case 1:
                                    eventTab
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
            .onChange(of: viewStore.state.currentTab) { _ in
                viewStore.send(.currentTabChanged, animation: .default)
            }
            .onChange(of: viewStore.state.isEditing) { _ in
                viewStore.send(.isEditingChanged, animation: .default)
                
            }
        }
    }
}

extension MainView {
    @MainActor
    var headerView: some View {
        VStack(alignment: .leading, spacing: 0) {
            LazyImage(url: URL(string: "https://i.namu.wiki/i/I63sEiy-8vUXVhV-I0IZiS9ntT0INuKXgBYAE3QqUvOlToSoEqSgpvEbUmxsFTXtoBRN4WJolyAFEAlDdeZFhQ.webp")) { state in
                if let image = state.image {
                    image
                        .customImage(.fill, height: 255)
                } else {
                    Rectangle() // TODO: placeholder 필요
                        .frame(width: .infinity, height: 255)
                        .foregroundStyle(Color.neutral100)
                }
            }
            .opacity(1 - progress)
            
            Button {
                store.send(.shopManagementButtonTapped, animation: .default)
            } label: {
                HStack(spacing: 8) {
                    Spacer()
                    
                    Image(.icnGear)
                        .customImage(width: 24, height: 24)
                        .padding(.vertical, 8)
                    
                    Text("가게 관리하기")
                        .mediumText(16, color: Color.main500)
                    
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
                    .boldText(20)
                    .padding(.vertical, 14)
                      
                Spacer()
                
                Button {
                    store.send(.shopManagementButtonTapped, animation: .default)
                } label: {
                    Image(.icnGear)
                        .customImage(width: 18, height: 18)
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
    var shopInfoView: some View { // TODO: 가게 정보를 받아와 func으로 교체
        VStack(alignment: .leading, spacing: 7) {
            HStack(spacing: 8) {
                Text("전화번호")
                    .regularText(14, color: Color.neutral500)
                    .frame(width: 64, alignment: .leading)
            
                Text("041-523-5849")
                    .regularText(14)
                
                Spacer()
            }
            
            HStack(spacing: 8) {
                Text("운영시간")
                    .regularText(14, color: Color.neutral500)
                    .frame(width: 64, alignment: .leading)
                
                Text("16:00 ~ 00:00")
                    .regularText(14)
                
                Spacer()
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text("휴무일")
                    .regularText(14, color: Color.neutral500)
                    .frame(width: 64, alignment: .leading)
                
                Text("매주 화요일")
                    .regularText(14)
                
                Spacer()
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text("주소정보")
                    .regularText(14, color: Color.neutral500)
                    .frame(width: 64, alignment: .leading)
                
                Text("천안시 동남구 총절로 880 가동 1층")
                    .regularText(14)
                
                Spacer()
            }
            
            HStack(spacing: 8) {
                Text("배달금액")
                    .regularText(14, color: Color.neutral500)
                    .frame(width: 64, alignment: .leading)
                
                Text("0원")
                    .regularText(14)
                
                Spacer()
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text("기타정보")
                    .regularText(14, color: Color.neutral500)
                    .frame(width: 64, alignment: .leading)
                
                Text("3대째 다져온 고집스러운 맛 3대째 다져온 고집스러운 맛 3대째 다져온 고집스러운 맛")
                    .regularText(14)
                
                Spacer()
            }
        }
    }
    
    func availableOptionView(_ option: String) -> some View { // TODO: 가정 정보를 받아와서 param 변경
        Text("# \(option) 가능")
            .regularText(12, color: Color.main300)
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
                    store.send(.menuButtonTapped)
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("tabBar", anchor: .top)
                    }
                } label: {
                    Text("메뉴")
                        .mediumText(16, color: store.state.currentTab == 0 ? Color.main500 : Color.neutral500)
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.screenWidth / 2)
                }
                
                Button {
                    store.send(.eventButtonTapped)
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("tabBar", anchor: .top)
                    }
                } label: {
                    Text("이벤트/공지")
                        .mediumText(16, color: store.state.currentTab == 1 ? Color.main500 : Color.neutral500)
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.screenWidth / 2)
                }
            }
            
            Rectangle()
                .frame(width: UIScreen.screenWidth / 2, height: 1.5)
                .foregroundStyle(Color.main500)
                .offset(x: CGFloat(store.state.currentTab) * (UIScreen.screenWidth / 2))
                .animation(.easeInOut, value: store.state.currentTab)
            
            switch store.state.currentTab {
            case 0:
                menuHeader
            case 1:
                eventHeader
            default:
                EmptyView()
            }
        }
        .padding(.top, currentOffset >= 592 ?  min(62, currentOffset - 592) : 0)
    }
    
    var menuHeader: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(MenuType.allCases, id: \.self) { type in
                    menuTypeButton(name: type.name, value: type.rawValue)
                }
            }
            .padding(.horizontal, 24)
        }
        .padding(.vertical, 8)
    }
    
    @ViewBuilder
    var eventHeader: some View {
        if store.state.isEditing {
            HStack(spacing: 18) {
                Button {
                    store.send(.eventSelectAllButtonTapped, animation: .default)
                } label: {
                    VStack(spacing: 2) {
                        Image(store.state.checkAllIdsIncluded ? .icnCircleCheck : .icnCircleEmpty)
                            .customImage(width: 16, height: 16)
                        
                        Text("전체")
                            .regularText(12, color: Color.neutral500)
                    }
                }

                Spacer()
                
                Button {
                    store.send(.eventEditButtonTapped, animation: .default)
                } label: {
                    HStack(spacing: 5) {
                        Image(.icnPencil)
                            .customImage(width: 16, height: 16)
                        
                        Text("수정")
                            .mediumText(14, color: Color.neutral500)
                    }
                    .padding(.vertical, 9)
                    .padding(.horizontal, 8)
                }
                
                Button {
                    store.send(.eventDeleteButtonTapped, animation: .default)
                } label: {
                    HStack(spacing: 5) {
                        Image(.icnTrashBin)
                            .customImage(width: 16, height: 16)
                        
                        Text("삭제")
                            .mediumText(14, color: Color.neutral500)
                    }
                    .padding(.vertical, 9)
                    .padding(.horizontal, 8)
                }
                
                Button {
                    store.send(.eventManagementCompleteButtonTapped, animation: .default)
                } label: {
                    HStack(spacing: 5) {
                        Image(.icnSquareEmpty)
                            .customImage(width: 16, height: 16)
                        
                        Text("완료")
                            .mediumText(14, color: Color.neutral500)
                    }
                    .padding(.vertical, 9)
                    .padding(.horizontal, 8)
                }
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(Color.neutral100)
            .overlay(alignment: .bottom) {
                Divider()
                    .foregroundStyle(Color.neutral200)
            }
        } else {
            HStack(spacing: 9) {
                Button {
                    store.send(.eventManagementButtonTapped, animation: .default)
                } label: {
                    HStack(spacing: 8) {
                        Spacer()
                        
                        Image(.icnPencil)
                            .customImage(width: 16, height: 16)
                        
                        Text("편집하기")
                            .mediumText(14, color: Color.neutral500)

                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color.neutral100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }

                Button {
                    store.send(.eventAddButtonTapped, animation: .default)
                } label: {
                    HStack(spacing: 8) {
                        Spacer()

                        Image(.icnAdd)
                            .customImage(width: 16, height: 16)
                        
                        Text("추가하기")
                            .mediumText(14, color: Color.neutral500)

                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .background(Color.neutral100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
            .frame(height: 52)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    MainView(store: .init(initialState: .init(), reducer: {
        MainFeature()._printChanges()
    }))
}
