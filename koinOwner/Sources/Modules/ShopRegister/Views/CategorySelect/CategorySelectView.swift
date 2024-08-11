//
//  CategorySelectView.swift
//  koinOwner
//
//  Created by 정영준 on 7/10/24.
//

import SwiftUI
import ComposableArchitecture

struct CategorySelectView: View {
    let store: StoreOf<CategorySelectFeature>
    @ObservedObject var viewStore: ViewStore<CategorySelectFeature.State, CategorySelectFeature.Action>
    
    init(store: StoreOf<CategorySelectFeature>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: { $0 })
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 15) {
                ForEach(1..<6) { index in
                    categoryButton(ShopCategory(rawValue: index) ?? .chicken, isSelected: viewStore.state.selectedCategory == ShopCategory(rawValue: index) ?? .chicken)
                }
            }
           
            .padding(.bottom, 30)
            
            HStack(spacing: 15) {
                ForEach(6..<10) { index in
                    categoryButton(ShopCategory(rawValue: index) ?? .chicken, isSelected: viewStore.state.selectedCategory == ShopCategory(rawValue: index) ?? .chicken)
                }
            }
            
            Spacer()
        }
    }
}

extension CategorySelectView {
    func categoryButton(_ category: ShopCategory, isSelected: Bool) -> some View {
        Button {
            viewStore.send(.categoryButtonTapped(category), animation: .default)
        } label: {
            VStack(spacing: 0) {
                Image(category.image)
                    .customImage(height: 50)
                    .padding(.bottom, 10)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(isSelected ? Color.sub500 : .clear)
                            .offset(y: -4) // TODO: 이미지 다시 만들어서 넣어야함. 지금 약간 삐뚤
                    }
                
                Text(category.title)
                    .regularText(13, color: isSelected ? Color.sub500 : Color.neutral800)
                    .frame(width: 60)
            }
        }
    }
}

enum ShopCategory: Int, CaseIterable {
    case none
    case chicken
    case pizza
    case lunchbox
    case pig
    case chinese
    case common
    case coffee
    case beauty
    case etc
    
    var title: String {
        switch self {
        case .none:
            return ""
        case .chicken:
            return "치킨"
        case .pizza:
            return "피자"
        case .lunchbox:
            return "도시락"
        case .pig:
            return "족발"
        case .chinese:
            return "중국집"
        case .common:
            return "일반음식점"
        case .coffee:
            return "카페"
        case .beauty:
            return "뷰티"
        case .etc:
            return "기타/콜밴"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .none:
            return .imgEtc
        case .chicken:
            return .imgChicken
        case .pizza:
            return .imgPizza
        case .lunchbox:
            return .imgLunchbox
        case .pig:
            return .imgPig
        case .chinese:
            return .imgChinese
        case .common:
            return .imgCommon
        case .coffee:
            return .imgCoffee
        case .beauty:
            return .imgBeauty
        case .etc:
            return .imgEtc
        }
    }
}

#Preview {
    CategorySelectView(store: .init(initialState: .init(), reducer: {
        CategorySelectFeature()._printChanges()
    }))
}
