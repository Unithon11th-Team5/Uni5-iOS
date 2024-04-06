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
     "name": "다연",
 }
 */

struct AuthorizationRequest: Codable {
    let email: String
    let token: String
    let name: String
}
