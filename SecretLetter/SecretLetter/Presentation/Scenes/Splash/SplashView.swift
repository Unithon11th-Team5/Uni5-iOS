//
//  SplashView.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationView {
            if let _ = UserDefaults.standard.string(forKey: "jwtToken") {
                HomeView()
            } else {
                AuthenticationView()
            }
        }
    }
}
