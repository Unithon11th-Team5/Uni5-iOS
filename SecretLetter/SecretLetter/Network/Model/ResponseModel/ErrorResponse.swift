//
//  ErrorResponse.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation

/*
 {
     "code": "4000",
     "message": "validation 오류가 발생했습니다"
 }
 */

struct ErrorResponse {
    let code: String
    let message: String
}
