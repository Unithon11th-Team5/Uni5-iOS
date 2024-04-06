//
//  AddEventCategoryViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct AddEventCategoryState {
    
}

enum AddEventCategoryInput {
    
}

class AddEventCategoryViewModel: ViewModel {
    @Published var state: AddEventCategoryState
    
    init(state: AddEventCategoryState) {
        self.state = state
    }
    
    func trigger(_ input: AddEventCategoryInput) {
        
    }
    
}
