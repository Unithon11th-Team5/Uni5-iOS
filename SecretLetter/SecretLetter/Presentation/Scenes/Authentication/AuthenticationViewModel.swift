//
//  AuthenticationViewModel.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import CryptoKit
import AuthenticationServices

struct AuthenticationState {
    var enctyptedNonce: String?
    var isLoading = false
    var successToSignIn = false
}

enum AuthenticationInput {
    case onAppear
    case signInWithApple(credential: ASAuthorizationAppleIDCredential)
}

class AuthenticationViewModel: ViewModel {
    @Published var state = AuthenticationState()
    
    func trigger(_ input: AuthenticationInput) {
        switch input {
        case .onAppear:
            createNonce()
        case let .signInWithApple(credential):
            signInWithApple(credential: credential)
        }
    }
    
    private func signInWithApple(credential: ASAuthorizationAppleIDCredential) {
        if let email = credential.email {
            let name = credential.fullName?.givenName
            guard let token = credential.identityToken else { return }
            guard let tokenString = String(data: token, encoding: .utf8) else { return }
            let param = AuthorizationRequest(
                email: email,
                token: tokenString,
                name: name ?? ""
            )
            Task {
                let completion = try await APIClient().appleSignIn(param)
                if completion {
                    await MainActor.run {
                        state.successToSignIn = true
                    }
                }
            }
        }
    }
    
    private func createNonce() {
        let rawNonce = randomNonceString()
        state.enctyptedNonce = sha256(rawNonce)
    }
    
    /// Create random nonce string
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(
            kSecRandomDefault,
            randomBytes.count,
            &randomBytes
        )
        if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
        }
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        let nonce = randomBytes.map { charset[Int($0) % charset.count] }
        
        return String(nonce)
    }
    
    /// Hashing function using CryptoKit
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
}
