//
//  SearchResultViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import Foundation

struct SearchResultState {
    var name: String?
    let nickname: String
    var events: [Event] = []
}

enum SearchResultInput {
    case onAppear
}

class SearchResultViewModel: ViewModel {
    @Published var state: SearchResultState
    private let api = APIClient()
    
    init(nickname: String) {
        self.state = SearchResultState(nickname: nickname)
    }
    
    func trigger(_ input: SearchResultInput) {
        switch input {
        case .onAppear:
            requestUserInfo()
        }
    }
}

extension SearchResultViewModel {
    private func requestUserInfo() {
        Task {
            let memberInfo = try await api.member(nickname: state.nickname)
            await MainActor.run {
                self.state.name = memberInfo.name
                self.requestEventList()
            }
        }
    }
    
    private func requestEventList() {
        Task {
            let events = try await api.event(nickname: state.nickname)
            await MainActor.run {
                state.events = events
            }
        }
    }
}

