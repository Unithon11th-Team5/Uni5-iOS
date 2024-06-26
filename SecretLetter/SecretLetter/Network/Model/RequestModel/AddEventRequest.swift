//
//  AddEventRequest.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

/*
 {
     "content": "메시지 내용",
     "plannedAt": "해당 이벤트 날짜",
 }
 */

struct AddEventRequest: Codable, DictionaryConvertor {
    let content: String
    let type: String
    let plannedAt: String
    
    init(content: String, type: String, date: Date) {
        self.content = content
        self.type = type
        self.plannedAt = DateHelper.shared.dateToString(date: date)
    }
}
