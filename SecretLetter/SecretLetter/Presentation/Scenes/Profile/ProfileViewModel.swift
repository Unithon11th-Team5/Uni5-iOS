//
//  ProfileViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import Foundation

struct ProfileState {
    var name = UserDefaults.standard.string(forKey: "name")!
    var email = UserDefaults.standard.string(forKey: "email")!
    var nickname: String {
        String(email.split(separator: "@")[0])
    }
    var events: [Event] = []
}

enum ProfileInput {
    case onAppear
}

class ProfileViewModel: ViewModel {
    @Published var state: ProfileState = ProfileState()
    
    func trigger(_ input: ProfileInput) {
        switch input {
        case .onAppear:
            requestEventList()
        }
    }
}

extension ProfileViewModel {
    private func requestEventList() {
        Task {
            let events = try await APIClient().event(nickname: state.nickname)
            await MainActor.run {
                state.events = events
                print(events)
            }
        }
    }
}
