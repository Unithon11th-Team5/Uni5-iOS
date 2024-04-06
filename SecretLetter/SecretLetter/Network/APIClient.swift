//
//  APIClient.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import Alamofire

class APIClient {
    
    private let baseURL: String = "https://secret-message.kro.kr/"
    private let jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
    
    private func url(_ path: String) -> String {
        return "\(self.baseURL)\(path)"
    }
    
}

// MARK: 로그인
extension APIClient {
    
    /// 애플 로그인
    func appleSignIn(_ param: AuthorizationRequest) async throws -> Bool {
        let requestUrl = url("login/apple")
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                requestUrl,
                method: .post,
                parameters: param,
                encoder: JSONParameterEncoder.default,
                headers: ["Content-Type": "application/json"]
            ).responseDecodable(of: AuthenticationResponse.self) { response in
                switch response.result {
                case .success(let json):
                    UserDefaults.standard.setValue(json.token, forKey: "jwtToken")
                    continuation.resume(returning: true)
                case .failure(let error):
                    print("Failed \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

// MARK: 메시지
extension APIClient {
    
    /// 메시지 전송
    func sendMessage(message: SendMessageRequest) {
        guard let jwtToken = jwtToken else { return }
        let token = jwtToken
        let param = message
        
        AF.request(
            url("messages/send"),
            method: .post,
            parameters: param,
            encoder: JSONParameterEncoder.default,
            headers: ["Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data): break
            case .failure(let error): break
            }
        }
    }
    
    /// 전체 메시지 리스트 조회
    func allReceivedMessage() async throws -> [Letter]? {
        guard let jwtToken = jwtToken else { return nil }
        let requestUrl = url("messages")
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                requestUrl,
                method: .get,
                headers: ["Content-Type": "application/json", "Authorization": "Bearer \(String(describing: jwtToken))"]
            ).responseDecodable(of: ReceiveLettersResponse.self) { response in
                switch response.result {
                case .success(let json):
                    continuation.resume(returning: json.messages)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    /// 읽지 않은 메시지 리스트 조회
    func unreadMessage() {
        guard let jwtToken = jwtToken else { return }
        let token = jwtToken
        
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
        guard let jwtToken = jwtToken else { return }
        let token = jwtToken
        
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
    func addEvent(content: String, type: EventType, date: Date) {
        
        let param = AddEventRequest(content: content, type: type.id, date: date)
        
        AF.request(
            url("events"),
            method: .post,
            parameters: param,
            encoder: JSONParameterEncoder.default,
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
