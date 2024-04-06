//
//  HomeView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

/// 홈 화면
struct HomeView: View {
    var body: some View {
        ZStack {
            Image(.defaultBackground)
                .ignoresSafeArea()
            
            Text("홈 화면")
                .bold()
                .font(.title)
        }
    }
}

#Preview {
    HomeView()
}
