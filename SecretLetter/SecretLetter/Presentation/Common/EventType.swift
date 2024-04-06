//
//  EventType.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

enum EventType: String, CaseIterable, Identifiable {
    case cheerUp
    case birthday
    case chooseock
    case christmas
    case nonEvent
    case etc
    
    var id: String {
        self.rawValue
    }
    
    var korean: String {
        switch self {
        case .cheerUp:
            "응원"
        case .birthday:
            "생일"
        case .chooseock:
            "추석"
        case .christmas:
            "크리스마스"
        case .nonEvent:
            "일상"
        case .etc:
            "기타"
        }
    }
}
