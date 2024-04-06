//
//  AddEventViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct AddEventDetailState {
    
}

enum AddEventDetailInput {
    
}

class AddEventDetailViewModel: ViewModel {
    @Published var state: AddEventDetailState
    
    init(state: AddEventDetailState) {
        self.state = state
    }
    
    func trigger(_ input: AddEventDetailInput) {
        
    }
    
}
