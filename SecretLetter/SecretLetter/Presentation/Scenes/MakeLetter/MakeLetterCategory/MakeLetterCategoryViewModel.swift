//
//  MakeLetterCategoryViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import Foundation

struct MakeLetterCategoryState {
    var selectedEvent: String?
}

enum MakeLetterCategoryInput {
    case selectEvent(EventType)
}

class MakeLetterCategoryViewModel: ViewModel {
    @Published var state = MakeLetterCategoryState()
    
    init(state: MakeLetterCategoryState = MakeLetterCategoryState()) {
        self.state = state
    }
    
    func trigger(_ input: MakeLetterCategoryInput) {
        switch input {
        case .selectEvent(let type):
            state.selectedEvent = type.rawValue
        }
    }
    
}

