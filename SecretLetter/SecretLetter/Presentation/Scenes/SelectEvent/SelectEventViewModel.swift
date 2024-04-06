//
//  SelectEventViewModel.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import Foundation

struct SelectEventState {
    var selectedEvent: String?
}

enum SelectEventInput {
    case selectEvent(EventType)
}

class SelectEventViewModel: ViewModel {
    @Published var state = SelectEventState()
    
    func trigger(_ input: SelectEventInput) {
        switch input {
        case .selectEvent(let type):
            state.selectedEvent = type.rawValue
        }
    }
}
