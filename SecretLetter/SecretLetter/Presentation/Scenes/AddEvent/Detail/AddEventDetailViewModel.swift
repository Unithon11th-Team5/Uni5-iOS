//
//  AddEventViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct AddEventDetailState {
    let eventType: EventType
    var date: Date = Date()
    var content: String = ""
}

enum AddEventDetailInput {
    case dataChanged
    case nextButtonTapped
}

class AddEventDetailViewModel: ViewModel {
    
    @Published var state: AddEventDetailState {
        didSet {
            self.changeNextButtonValidation()
        }
    }
    @Published var isNextButtonActive: Bool = false
    @Published var isShowCalendarPopup: Bool = false
    @Published var navigationAction: Bool? = false
    
    init(type: EventType) {
        self.state = AddEventDetailState(eventType: type)
    }
    
    func trigger(_ input: AddEventDetailInput) {
        switch input {
        case .dataChanged:
            self.changeNextButtonValidation()
        case .nextButtonTapped:
            self.requestAddEvent()
            self.navigationAction = true
        }
    }
    
}

extension AddEventDetailViewModel {
    private func isNextButtonValid() -> Bool {
        return state.content.isEmpty == false
    }
    
    private func changeNextButtonValidation() {
        self.isNextButtonActive = isNextButtonValid()
    }
}

extension AddEventDetailViewModel {
    private func requestAddEvent() {
        let api = APIClient()
        api.addEvent(content: state.content, type: state.eventType, date: state.date)
    }
}
