//
//  AuthorizationRequest.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import Foundation

/*
 {
     "email": "0217dayun@naver.com",
     "token": "apple id token",
 }
 */

struct AuthorizationRequest: Codable {
    let email: String
    let token: String
    
    func toDictionary() -> [String: Any] {
        [
            "email": email,
            "token": token
        ]
    }
}
