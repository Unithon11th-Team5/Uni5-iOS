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
                Spacer()
                    .frame(height: 65)
                VStack(spacing: 23) {
                    Text("프로필")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.black)
                    HStack(alignment: .bottom) {
                        Image(systemName: "person.fill")
                        Text(viewModel.state.name)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.black)
                        Text(viewModel.state.email)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(.black)
                    }
                    Rectangle()
                        .fill(.black)
                        .frame(width: UIScreen.main.bounds.width, height: 1)
                }
                
                ForEach(viewModel.state.events) { event in
                    /* 리스트 ... 뷰 따로 ㄱ뺄게요... (좀이따) */
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                            .modifier(RectangleStrokeModifier())
                        HStack(spacing: 8) {
                            Text(event.type)
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.black)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(.accent)
                                )
                            Text(event.content)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(Color.black)
                            Spacer()
                            Text(event.plannedAt)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(Color.black)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                    }
                    .frame(height: 60)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                }
                .contentMargins(.bottom, 100, for: .scrollContent)
                
                Spacer()
            }
        }
        .onAppear(perform: { viewModel.trigger(.onAppear) })
    }
}

#Preview {
    ProfileView()
}
