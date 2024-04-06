//
//  MakeLetterResultView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import SwiftUI

struct MakeLetterResultView: View {
    
    var body: some View {
        
        ZStack {
            Image(.plainBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer().frame(height: 110)
                
                Image(.titleFrame)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 91)
                    .overlay(alignment: .center) {
                        Text("메세지 전송 완료!")
                            .font(.title)
                            .bold()
                    }
                
                Spacer().frame(height: 16)
                
                Text("편지가 성공적으로 전송되었습니다")
                
                Spacer()
                
                // 편지 내용 뷰 - 대체 예정
                Rectangle()
                    .fill(.accent)
                    .frame(width: 300, height: 200)
                
                Spacer()
                
                Button(action: {
                    self.goToHome()
                }, label: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.black, lineWidth: 1)
                        .fill(.black)
                        .frame(width: 350, height: 60)
                        .overlay(alignment: .center) {
                            Text("홈으로 이동")
                                .foregroundStyle(.white)
                        }
                })
                
                Spacer().frame(height: 54)
            }
        }
    }
}

extension MakeLetterResultView {
    private func goToHome() {
        // TODO: 홈 화면 이동
    }
}

#Preview {
    MakeLetterResultView()
}
