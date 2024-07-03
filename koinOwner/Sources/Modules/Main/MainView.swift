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
    
    @State var progress: CGFloat = 0
    @State var currentOffset: CGFloat = 0
    @State var snapTo: SnapHeaderState?
    private let minHeight = 56.0
    private let maxHeight = 364.0
    
    var body: some View {
        VStack(spacing: 0) {
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
                    Section(header: tabBar().background(Color.neutral0)) {
                        
                        Rectangle()
                            .frame(height: 1000)
                            .foregroundStyle(Color.sub200)
                    }
                   
                }
               
                
            }
            .height(min: minHeight, max: maxHeight)
            .collapseProgress($progress)
            .snapHeaderToState($snapTo)
            .scrollOffset($currentOffset)
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
    func tabBar() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    currentTab = 0
                    snapTo = .custom(286)
                } label: {
                    Text("메뉴")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundStyle(currentTab == 0 ? Color.main500 : Color.neutral500)
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.screenWidth / 2)
                }
                
                Button {
                    currentTab = 1
                    snapTo = .custom(286)
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

#Preview {
    MainView()
}
