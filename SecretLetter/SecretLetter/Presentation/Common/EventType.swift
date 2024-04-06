//
//  EventType.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

enum EventType: String, CaseIterable, Identifiable {
    case cheerUp = "CHEER_UP"
    case birthday = "BIRTHDAY"
    case chooseock = "THANKSGIVING"
    case christmas = "CHRISTMAS"
    case nonEvent = "NON_EVENT"
    case marrige = "MARRIGE"
    
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
            "명절"
        case .christmas:
            "연말"
        case .nonEvent:
            "일상"
        case .marrige:
            "결혼"
        }
    }
}

