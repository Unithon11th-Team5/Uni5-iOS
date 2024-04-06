//
//  ProfileView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Image(.plainBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 23) {
                    Text("프로필")
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Text(viewModel.state.name)
                            .bold()
                        
                        Text(viewModel.state.email)
                    }
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: .infinity, height: 1)
                }
                
                ForEach(viewModel.state.events, id: \.plannedAt) { event in
                    Text(event.content)
                        .background(.white)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
