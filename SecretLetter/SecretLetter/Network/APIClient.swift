//
//  APIClient.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import Alamofire

class APIClient {
    
    private let baseURL: String = "http://3.35.112.110/"
    
    private func url(_ path: String) -> String {
        return "\(self.baseURL)\(path)"
    }
    
}

// MARK: Sign In
extension APIClient {
    
    /// 애플 로그인
    func appleSignIn() {
        
        AF.request(
            "\(baseURL)login/apple",
            method: .post,
            headers: ["Content-Type":"application/json"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data):
                print("Success")
            case .failure(let error):
                print("Fail")
            }
        }
    }
}

// MARK: Message Related
extension APIClient {
    /*
     POST http://3.35.112.110/messages/send
     Content-Type: application/json
     Authorization: Bearer {jwt Token}
     */
    func sendMessage() {
        // TODO: 일해라 핫산
    }

}
