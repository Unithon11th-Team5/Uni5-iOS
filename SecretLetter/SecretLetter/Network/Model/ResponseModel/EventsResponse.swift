//
//  EventsResponse.swift
//  SecretLetter
//
//  Created by 제나 on 4/7/24.
//

import Foundation

struct EventsResponse: Codable {
    let events: [Event]
}

struct Event: Codable, Identifiable {
    let id: String
    let content: String
    let type: String
    let plannedAt: String
}
