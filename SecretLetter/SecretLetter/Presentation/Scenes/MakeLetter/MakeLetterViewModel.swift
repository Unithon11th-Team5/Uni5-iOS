//
//  MakeLetterViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

struct MakeLetterState {
    var senderName: String = ""
    var arrivalDate: Date = Date()
    var messageContent: String = ""
    var isToMyself: Bool = false
    var receiverName: String = ""
}

enum MakeLetterInput {
    /// 메시지 데이터 변경됨
    case invoiceDataChanged
    /// 전송 버튼 선택
    case sendButtonTapped
}


class MakeLetterViewModel: ViewModel {
    
    @Published var state: MakeLetterState {
        didSet {
            self.trigger(.invoiceDataChanged)
        }
    }
    @Published var isButtonActivated: Bool = false
    @Published var isShowCalanderPopup: Bool = false
    
    let api = APIClient()
    
    init(senderName: String) {
        self.state = MakeLetterState(senderName: senderName)
    }
    
    func trigger(_ input: MakeLetterInput) {
        switch input {
        // Input Changed
        case .invoiceDataChanged:
            self.changeButtonValidationSate()
            
        // Button Tap
        case .sendButtonTapped:
            self.postNewMessage()
        }
    }
   
}

extension MakeLetterViewModel {
    private func checkButtonValidation() -> Bool {
        if state.senderName.isEmpty == false,
           state.messageContent.isEmpty == false,
           state.receiverName.isEmpty == false {
            return true
        }
        
        return false
    }
    
    private func changeButtonValidationSate() {
        self.isButtonActivated = self.checkButtonValidation()
    }
}

extension MakeLetterViewModel {
    
    private func postNewMessage() {
        
        guard checkButtonValidation() == true else { return }
        
        let message = SendMessageRequest(
            receiverNickname: state.receiverName,
            senderName: state.senderName,
            content: state.messageContent,
            type: "",   // TODO: 바꿔야됨
            sendPlannedAtDate: state.arrivalDate
        )
        
        print(message)
        self.api.sendMessage(message: message)
    }

}
