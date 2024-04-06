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

// MARK: 로그인
extension APIClient {
    
    /// 애플 로그인
    func appleSignIn(_ param: AuthorizationRequest) {
        let requestUrl = url("login/apple")
        AF.request(
            requestUrl,
            method: .post,
            parameters: param.toDictionary(),
            headers: ["Content-Type": "application/json"]
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

// MARK: 메시지
extension APIClient {
    
    /// 메시지 전송
    func sendMessage(message: SendMessageRequest) {
        
        let token = "jwt"
        let param = message.toDictionary()
        
        AF.request(
            url("messages/send"),
            method: .post,
            headers: ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }

    /// 읽지 않은 메시지 리스트 조회
    func unreadMessage() {
        
        let token = "jwt"
        
        AF.request(
            url("messages/unread"),
            method: .post,
            headers: ["Authorization": "Bearer \(token)"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }
    
    /// 받은 단일 메시지 조회
    func singleMessage(id: String) {
        let token = "jwt"
        
        AF.request(
            url("messages/\(id)"),
            method: .get,
            headers: ["Authorization": "Bearer \(token)"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }
}

// MARK: 이벤트
extension APIClient {
    func addEvent(content: String, date: Date) {
        
        AF.request(
            url("events"),
            method: .get,
            headers: ["Content-Type": "application/json"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }
}
