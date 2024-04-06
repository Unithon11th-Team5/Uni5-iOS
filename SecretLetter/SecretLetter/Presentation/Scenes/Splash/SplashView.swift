//
//  SplashView.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import SwiftUI

struct SplashView: View {
    
    #warning("need fix - 옵저빙 안되는 것 같아서")
    @State private var jwtToken = UserDefaults.standard.string(forKey: "jwtToken")
    var body: some View {
        if let jwtToken = jwtToken {
            HomeView()
        } else { /* need sign in */
            AuthenticationView()
        }
    }
}
