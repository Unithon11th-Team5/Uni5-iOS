//
//  HomeView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

/// 홈 화면
struct HomeView: View {
    let screenSize = UIScreen.main.bounds.size
    var body: some View {
        ZStack {
            TabView {
                ReceivedLetterView()
                    .tabItem {
                        Image(.bubble)
                        Text("수신함")
                            .foregroundStyle(Color.text)
                            .accentColor(.text)
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("프로필")
                            .foregroundStyle(Color.text)
                            .accentColor(.text)
                    }
            }
            Button {
                
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundStyle(.text)
                        .shadow(radius: 5, x: 1, y: 1)
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                }
            }
            .position(
                x: screenSize.width - 50,
                y: screenSize.height - 180
            )
        }
    }
}

struct TempView: View {
    var body: some View {
        HStack {
            
        }
    }
}

#Preview {
    HomeView()
}
