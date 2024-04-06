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
     "fullName": "Dayeon Moon",
     "content": "보낼 메시지",
     "token": "apple id token",
     "authroizationCode": "authorization code"
 }
 */

struct AuthorizationRequest: Codable, DictionaryConvertor {
    let email: String
    let token: String
}
