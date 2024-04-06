//
//  HomeView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI
import PopupView

/// 홈 화면
struct HomeView: View {
    let screenSize = UIScreen.main.bounds.size
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.state.selectedTabTag) {
                ReceivedLetterView()
                    .tabItem {
                        Image(.bubble)
                        Text("수신함")
                            .foregroundStyle(Color.text)
                            .accentColor(.text)
                    }
                    .tag(1)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("프로필")
                            .foregroundStyle(Color.text)
                            .accentColor(.text)
                    }
                    .tag(2)
            }
            Button {
                viewModel.trigger(.clickedToNavigate)
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
        .popup(isPresented: $viewModel.state.navigateToMakeLetter) {
            
        }
        .popup(isPresented: $viewModel.state.navigateToProfile) {
            
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
