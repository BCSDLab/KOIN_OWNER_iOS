//
//  MainFeature.swift
//  koinOwner
//
//  Created by 정영준 on 7/25/24.
//

import ComposableArchitecture

@Reducer
struct MainFeature: Reducer {

    @ObservableState
    struct State: Equatable {
        var currentTab: Int = 0
        var currentMenu: Int = -1
        var isEditing: Bool = false
        var currentEvent: Int = -1
        
        var selectedEvent: [Int] = []
        var checkAllIdsIncluded: Bool {
            let allIds = Set(Event.mock.map { $0.id })
            let selectedIds = Set(selectedEvent)
            
            return allIds.isSubset(of: selectedIds)
        }
    }

    enum Action {
        case shopManagementButtonTapped
        case currentTabChanged
        case isEditingChanged
        case menuButtonTapped
        case eventButtonTapped
        case eventManagementButtonTapped
        case eventAddButtonTapped
        case eventSelectAllButtonTapped
        case eventEditButtonTapped
        case eventDeleteButtonTapped
        case eventManagementCompleteButtonTapped
        case menuTypeButtonTapped(Int)
        case eventRowTapped(Event, Bool)
    }

    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .shopManagementButtonTapped:
                // TODO: 화면 이동
                return .none
                
            case .currentTabChanged:
                state.currentMenu = -1
                state.currentEvent = -1
                state.isEditing = false
                return .none
                
            case .isEditingChanged:
                state.currentEvent = -1
                state.selectedEvent.removeAll()
                return .none
                
            case .menuButtonTapped:
                state.currentTab = 0
                return .none
                
            case .eventButtonTapped:
                state.currentTab = 1
                return .none
                
            case .eventManagementButtonTapped:
                state.isEditing = true
                return .none
                
            case .eventAddButtonTapped:
                // TODO: 기능 구현
                return .none
                
            case .eventSelectAllButtonTapped:
                if state.checkAllIdsIncluded {
                    state.selectedEvent.removeAll()
                } else {
                    for event in Event.mock {
                        if !state.selectedEvent.contains(where: { $0 == event.id }) {
                            state.selectedEvent.append(event.id)
                        }
                    }
                }
                return .none
                
            case .eventEditButtonTapped:
                // TODO: 기능 구현
                return .none
                
            case .eventDeleteButtonTapped:
                // TODO: 기능 구현
                return .none
                
                
            case .eventManagementCompleteButtonTapped:
                state.isEditing = false
                return .none
                
            case let .menuTypeButtonTapped(value):
                if state.currentMenu == value {
                    state.currentMenu = -1
                } else {
                    state.currentMenu = value
                }
                return .none
                
            case let .eventRowTapped(event, isCurrentEvent):
                if state.isEditing {
                    if state.selectedEvent.contains(where: { $0 == event.id }) {
                        state.selectedEvent.removeAll(where: { $0 == event.id })
                    } else {
                        state.selectedEvent.append(event.id)
                    }
                } else {
                    if isCurrentEvent {
                        state.currentEvent = -1
                    } else {
                        state.currentEvent = event.id
                    }
                }
                return .none
            }
        }
    }
}

