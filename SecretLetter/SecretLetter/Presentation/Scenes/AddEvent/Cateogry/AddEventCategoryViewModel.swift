//
//  AddEventCategoryViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct AddEventCategoryState {
    var selectedEvent: String?
}

enum AddEventCategoryInput {
    case selectEvent(EventType)
}

class AddEventCategoryViewModel: ViewModel {
    @Published var state: AddEventCategoryState
    
    init(state: AddEventCategoryState = AddEventCategoryState()) {
        self.state = state
    }
    
    func trigger(_ input: AddEventCategoryInput) {
        switch input {
        case .selectEvent(let type):
            state.selectedEvent = type.rawValue
        }
    }
    
}
