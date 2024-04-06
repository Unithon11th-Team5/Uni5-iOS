//
//  MemberResponse.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import Foundation

/*
 {
   "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
   "nickname": "string",
   "identifier": "string",
   "name": "string"
 }
 */

struct MemberResponse: Codable {
    let id: String
    let nickname: String
    let identifier: String
    let name: String
}
