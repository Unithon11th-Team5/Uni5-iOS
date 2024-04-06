//
//  AddEventCompleteViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct AddEventCompleteState {
    
}

enum AddEventCompleteInput {
    
}

class AddEventCompleteViewModel: ViewModel {
    @Published var state: AddEventCompleteState
    
    init(state: AddEventCompleteState) {
        self.state = state
    }
    
    func trigger(_ input: AddEventCompleteInput) {
        
    }
    
}
