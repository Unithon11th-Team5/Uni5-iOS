//
//  UnreadMessageResponse.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

/*
 [
     {
         "id": "메시지 고유 UUID",
         "senderName": "보낸 사람이 설정한 닉네임",
         "content": "메시지 내용",
         "sentAt": "2024-04-06",
         "type": "메시지 타입"
     },
     {
         "id": "메시지 고유 UUID",
         "senderName": "보낸 사람이 설정한 닉네임",
         "content": "메시지 내용",
         "sentAt": "2024-04-06",
         "type": "메시지 타입"
     }
 ]
 */

struct UnreadMessageResponse {
    let message: MessageResponse
}
