//
//  SendMessageRequest.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

/*
 {
     "receiverNickname": "nick123",
     "senderName": "보내는 닉네임",
     "content": "보낼 메시지",
     "type": "메시지 타입",
     "sendPlannedAt": "2024-04-28"
 }
 */

struct SendMessageRequest: Codable {
    let receiverNickname: String
    let senderName: String
    let content: String
    let type: String
    let sendPlannedAt: String
}
