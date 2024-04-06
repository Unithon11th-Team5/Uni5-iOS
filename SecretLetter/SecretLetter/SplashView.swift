//
//  SplashView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI
import AuthenticationServices

struct SplashView: View {
    var body: some View {
        ZStack {
            Image(.splashBackground)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SignInWithAppleButton(
                    onRequest: { _ in
                        print("Apple Button Tapped")
                    }, onCompletion: { result in
                        print("Apple Signin Result: \(result)")
                    }
                )
                .frame(width: 330, height: 52)
                
                Spacer()
                    .frame(height: 80)
            }
            
        }
    }
}

#Preview {
    SplashView()
}
