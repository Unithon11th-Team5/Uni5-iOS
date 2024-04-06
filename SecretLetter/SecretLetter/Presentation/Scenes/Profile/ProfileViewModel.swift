//
//  ProfileViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import Foundation

struct ProfileState {
    var name: String = ""
    var email: String = ""
    var events: [MemberEventRequest] = []
}

enum ProfileInput {
    case selectEvent(EventType)
}

class ProfileViewModel: ViewModel {
    @Published var state: ProfileState = ProfileState()
    
    init() {
        self.requestUserInfo()
        self.requestEventList()
    }
    
    func trigger(_ input: ProfileInput) {

    }
}

extension ProfileViewModel {
    
    private func requestUserInfo() {
        self.state.name = "김영지"
        self.state.email = "elice@email.com"
    }
    
    private func requestEventList() {
        self.state.events = []
    }
}
