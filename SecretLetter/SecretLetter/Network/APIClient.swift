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
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(AuthenticationResponse.self, from: data as! Data)
                    UserDefaults.standard.setValue("jwtToken", forKey: json.token)
                    print("=== DEBUG: \(json.token)")
                } catch {
                    print("error \(error)")
                }
            case .failure(let error):
                print("Fail \(error)")
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
            parameters: param,
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
            method: .get,
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
    
    /// 이벤트 추가
    func addEvent(content: String, date: Date) {
        
        let param = AddEventRequest(content: content, date: date).toDictionary()
        
        AF.request(
            url("events"),
            method: .get,
            parameters: param,
            headers: ["Content-Type": "application/json"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }
    
    
    /// 특정 멤버의 이벤트
    func event(memberId: String) {
        AF.request(
            url("events?memberId=\(memberId)"),
            method: .get
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }
}
