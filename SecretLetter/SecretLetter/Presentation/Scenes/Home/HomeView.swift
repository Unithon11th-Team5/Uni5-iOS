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
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "GridBackgroundColor3") ?? .systemTeal
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.state.selectedTabTag) {
                ReceivedLetterView()
                    .tabItem {
                        Image(systemName: "bubble.left.fill")
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
                
                SearchFieldView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                            .foregroundStyle(Color.text)
                            .accentColor(.text)
                    }
                    .tag(3)

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
        .fullScreenCover(isPresented: $viewModel.state.navigateToMakeLetter) {
            NavigationView {
                MakeLetterCategoryView()
                    .navigationBarBackButtonHidden()
            }
        }
        .fullScreenCover(isPresented: $viewModel.state.navigateToProfile) {
            NavigationView {
                AddEventCategoryView()
                    .navigationBarBackButtonHidden()
            }
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
