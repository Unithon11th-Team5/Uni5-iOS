//
//  HomeViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct HomeState {
    var selectedTabTag = 1
    var navigateToMakeLetter = false
    var navigateToProfile = false
}

enum HomeInput {
    case clickedToNavigate
}

class HomeViewModel: ViewModel {
    @Published var state = HomeState()
    
    func trigger(_ input: HomeInput) {
        switch input {
        case .clickedToNavigate:
            clickedToNavigate()
        }
    }
    
    private func clickedToNavigate() {
        if state.selectedTabTag == 1 {
            toggleNavigateToMakeLetterFlag()
        } else {
            toggelNavigateToProfileFlag()
        }
    }
    
    private func toggleNavigateToMakeLetterFlag() {
        state.navigateToMakeLetter.toggle()
    }
    
    private func toggelNavigateToProfileFlag() {
        state.navigateToProfile.toggle()
    }
}
