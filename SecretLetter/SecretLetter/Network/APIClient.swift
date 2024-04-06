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
                    UserDefaults.standard.setValue(param.name, forKey: "name")
                    UserDefaults.standard.setValue(param.email, forKey: "email")
                    continuation.resume(returning: true)
                case .failure(let error):
                    print("Failed \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    /// get user info
    func getUserId() async throws -> String? {
        guard let jwtToken = jwtToken else { return nil }
        let requestUrl = url("login/info")
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                requestUrl,
                method: .get,
                headers: ["Content-Type": "application/json", "Authorization": "Bearer \(String(describing: jwtToken))"]
            ).responseDecodable(of: LoginInfoResponse.self) { response in
                switch response.result {
                case .success(let json):
                    print(json.id)
                    continuation.resume(returning: json.id)
                case .failure(let error):
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
        guard let jwtToken = jwtToken else { return }
        let param = AddEventRequest(content: content, type: type.id, date: date)
        
        AF.request(
            url("events"),
            method: .post,
            parameters: param,
            encoder: JSONParameterEncoder.default,
            headers: ["Content-Type": "application/json", "Authorization": "Bearer \(jwtToken)"]
        ).responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error): break
            }
        }
    }
    
    /// 특정 멤버의 이벤트
    func event(nickname: String) async throws -> [Event] {
        guard let jwtToken = jwtToken else { return [] }
        let requestUrl = url("events?nickName=\(nickname)")
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                requestUrl,
                method: .get,
                headers: ["Content-Type": "application/json", "Authorization": "Bearer \(String(describing: jwtToken))"]
            ).responseDecodable(of: EventsResponse.self) { response in
                switch response.result {
                case .success(let json):
                    continuation.resume(returning: json.events)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func member(nickname: String) async throws -> MemberResponse {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url("member?nickname=\(nickname)"),
                method: .get
            ).responseDecodable(of: MemberResponse.self) { response in
                switch response.result {
                case .success(let json):
                    continuation.resume(returning: json)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
