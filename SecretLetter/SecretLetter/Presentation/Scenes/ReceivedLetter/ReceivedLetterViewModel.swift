//
//  ReceivedLetterViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation


struct ReceivedLetterState {
    var receivedLetters = [Letter]()
    var showPopUp = false
    var showingLetterId: String?
}

enum ReceivedLetterInput {
    case onAppear
    case clickedLetterGrid(String)
}

class ReceivedLetterViewModel: ViewModel {
    @Published var state = ReceivedLetterState()
    
    func trigger(_ input: ReceivedLetterInput) {
        switch input {
        case .onAppear:
            onAppear()
        case .clickedLetterGrid(let id):
            clickedLetterGrid(id)
        }
    }
    
    private func onAppear() {
        Task {
            await getReceivedMessages()
        }
    }
    
    private func getReceivedMessages() async {
        do {
            let letters = try await APIClient().allReceivedMessage()
            await MainActor.run {
                if let letters = letters {
                    state.receivedLetters = letters
                }
            }
        } catch {
            print("=== error: \(error)")
        }
    }
    
    private func clickedLetterGrid(_ id: String) {
        state.showingLetterId = id
        state.showPopUp = true
    }
}
