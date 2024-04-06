//
//  AddEventCompleteView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct AddEventCompleteView: View {
    
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
                        Text("이벤트 생성 완료!")
                            .bold()
                    }
                
                Spacer().frame(height: 16)
                
                Text("친구들에게 공유해 메시지를 받아보세요")
                
                Spacer()
                
                Image(.eventComplete)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 228)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        // TODO: 공유하기
                    }, label: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 1)
                            .fill(.black)
                            .frame(width: 350, height: 60)
                            .overlay(alignment: .center) {
                                Text("공유하기")
                                    .foregroundStyle(.white)
                            }
                    })
                    
                    Button(action: {
                        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
                    }, label: {
                        Text("완료")
                            .foregroundStyle(.black)
                    })
                }
                
                Spacer().frame(height: 54)
            }
        }

    }
}

#Preview {
    AddEventCompleteView()
}
