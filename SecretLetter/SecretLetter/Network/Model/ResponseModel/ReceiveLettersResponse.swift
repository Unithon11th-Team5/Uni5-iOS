//
//  ReceiveLettersRequest.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import Foundation

struct Letter: Codable, Identifiable {
    let id: String
    let senderName: String
    let content: String
    let sentAt: String
    let type: String
}

struct ReceiveLettersResponse: Codable {
    let messages: [Letter]
}
