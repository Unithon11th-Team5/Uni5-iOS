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
    var receiverName: String = ""
    var eventType: EventType
}

enum MakeLetterInput {
    /// 메시지 데이터 변경됨
    case invoiceDataChanged
    /// 나에게 전송 체크/해제됨
    case sendToMyselfChanged
    /// 전송 버튼 선택
    case sendButtonTapped
    /// 팝업 확인 버튼 선택
    case lastPopupConfirm
}


class MakeLetterViewModel: ViewModel {
    
    let userName: String
    
    @Published var state: MakeLetterState {
        didSet {
            self.trigger(.invoiceDataChanged)
        }
    }
    @Published var isToMySelfChecked: Bool = false {
        didSet {
            self.trigger(.sendToMyselfChanged)
        }
    }
    
    @Published var isButtonActivated: Bool = false
    @Published var isReceiverFieldActivated: Bool = true
    
    @Published var isShowCalanderPopup: Bool = false
    @Published var isShowLastCheckPopup: Bool = false
    
    @Published var navigationAction: Bool? = false
    
    let api = APIClient()
    
    init(userName: String, eventType: EventType) {
        self.userName = userName
        self.state = MakeLetterState(senderName: userName, eventType: eventType)
    }
    
    func trigger(_ input: MakeLetterInput) {
        switch input {
        // Input Changed
        case .invoiceDataChanged:
            self.changeButtonValidationSate()
        case .sendToMyselfChanged:
            self.changeReceiverFieldValidationState()
            self.changeButtonValidationSate()
            
        // Button Tap
        case .sendButtonTapped:
            self.isShowLastCheckPopup = true
        case .lastPopupConfirm:
            self.postNewMessage()
            self.navigationAction = true
        }
        
    }
   
}

extension MakeLetterViewModel {
    private func checkButtonValidation() -> Bool {
        if state.senderName.isEmpty == false,
           state.messageContent.isEmpty == false,
           (state.receiverName.isEmpty == false || isToMySelfChecked) {
            return true
        }
        
        return false
    }
    
    private func changeButtonValidationSate() {
        self.isButtonActivated = self.checkButtonValidation()
    }
    
    private func changeReceiverFieldValidationState() {
        self.isReceiverFieldActivated = !self.isToMySelfChecked
    }
}

extension MakeLetterViewModel {
    
    private func postNewMessage() {
        
        guard checkButtonValidation() == true else { return }
        
        let myNickname = UserDefaults.standard.string(forKey: "email")?.split(separator: "@").first
        
        let message = SendMessageRequest(
            receiverNickname: isToMySelfChecked ? String(myNickname ?? "") : state.receiverName,
            senderName: state.senderName,
            content: state.messageContent,
            type: state.eventType.id,
            sendPlannedAtDate: state.arrivalDate
        )
        
        self.api.sendMessage(message: message)
    }

}
