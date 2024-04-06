//
//  SplashViewModel.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import Foundation

struct SplashState {
    var hasJwtToken = false
}

enum SplashInput {
    
}

class SplashViewModel: ViewModel {
    @Published var state = SplashState()
    
    func trigger(_ input: SplashInput) {
        
    }
}
