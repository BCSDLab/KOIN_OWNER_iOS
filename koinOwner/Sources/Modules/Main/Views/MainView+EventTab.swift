//
//  MainView+EventTab.swift
//  koinOwner
//
//  Created by 정영준 on 7/4/24.
//

import SwiftUI
import NukeUI

extension MainView {
    @MainActor
    var eventTab: some View {
        VStack(spacing: 0) {
            ForEach(Event.mock) { event in
                eventRow(event: event)
            }
        }
    }
    
    @MainActor
    func eventRow(event: Event) -> some View {
        let isCurrentEvent: Bool = currentEvent == event.id
        let layout = isCurrentEvent ? AnyLayout(VStackLayout(spacing: 16)) : AnyLayout(HStackLayout(spacing: 16))
        return Button {
            if isEditing {
                withAnimation {
                    if selectedEvent.contains(where: { $0 == event.id }) {
                        selectedEvent.removeAll(where: { $0 == event.id })
                    } else {
                        selectedEvent.append(event.id)
                    }
                }
            } else {
                withAnimation {
                    if isCurrentEvent {
                        currentEvent = -1
                    } else {
                        currentEvent = event.id
                    }
                }
            }
        } label: {
            layout {
                Button {
                    if isCurrentEvent {
                       // TODO: 이미지 크게 보여주기
                    }
                } label: {
                    LazyImage(url: URL(string: "https://i.namu.wiki/i/I63sEiy-8vUXVhV-I0IZiS9ntT0INuKXgBYAE3QqUvOlToSoEqSgpvEbUmxsFTXtoBRN4WJolyAFEAlDdeZFhQ.webp")) { state in
                        if let image = state.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: isCurrentEvent ? UIScreen.screenWidth - 48 : 72, height: isCurrentEvent ? 363 : 80)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        } else {
                            RoundedRectangle(cornerRadius: 5) // TODO: placeholder 필요
                                .frame(width: isCurrentEvent ? UIScreen.screenWidth - 48 : 72, height: isCurrentEvent ? 363 : 80)
                                .foregroundStyle(Color.neutral100)
                        }
                    }
                    .overlay(alignment: .topLeading) {
                        Image(.icnCircleCheck)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .opacity(selectedEvent.contains(event.id) ? 1 : 0)
                            .offset(x: -8, y: -8)
                    }
                }
                .disabled(!isCurrentEvent)

                                
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 0) {
                            Text(event.title)
                                .mediumText(16)
            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Text("전체보기")
                                    .mediumText(12, color: Color.neutral500)
                                
                                Image(isCurrentEvent ? .icnChevronUp : .icnChevronDown)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                            }
                        }
                        .padding(.bottom, 8)
                        
                        Text(event.content)
                            .regularText(12, color: Color.neutral500)
                            .lineLimit(currentEvent == event.id ? .none : 2)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 6)

                        Text("\(event.startDate) - \(event.endDate)")
                            .regularText(10, color: Color.neutral500)
                    }
                }
            }
            .padding(.vertical, 12)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.neutral200)
            }
            .padding(.horizontal, 24)

        }
        
    }
    
  
}

struct Event: Hashable, Identifiable {
    var id: Int
    var title: String
    var content: String
    var startDate: String
    var endDate: String
    
    static let mock: [Event] = [
        Event(id: 1, title: "24년 신년 이벤트", content: "24년을 맞이해 학생들의 어쩌구저쩌구 그래서 할인 이벤트를 진행합니다. ", startDate: "2024.01.01", endDate: "2024.01.14"),
        Event(id: 2, title: "24년 신년 이벤트", 
              content: "24년을 맞이해 학생들의 어쩌구저쩌구 그래서 할인 이벤트를 진행합니다 24년을 맞이해 학생들의 어쩌구저쩌구 어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구 저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구 어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구", 
              startDate: "2024.01.01",
              endDate: "2024.01.14")
    ]
}
