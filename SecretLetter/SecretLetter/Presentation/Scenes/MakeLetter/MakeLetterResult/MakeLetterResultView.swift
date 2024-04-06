//
//  MakeLetterResultView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import SwiftUI

struct MakeLetterResultView: View {
    
    let letterInfo: MakeLetterState
    
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
                
                LetterGridView(
                    multiply: 2.0,
                    backgroundColor: .accent,
                    letter: Letter(
                        id: "",
                        senderName: letterInfo.senderName,
                        content: letterInfo.messageContent,
                        sentAt: letterInfo.receiverName,
                        type: letterInfo.eventType.korean
                    ),
                    receiverName: letterInfo.receiverName
                )
                .frame(width: UIScreen.main.bounds.width - 100)
                .overlay(alignment: .topLeading) {
                    Image(.glasshour)
                        .resizable()
                        .frame(width: 36 * 2, height: 50 * 2)
                        .offset(x: -30, y: -30)
                }
                .overlay(alignment: .bottomTrailing) {
                    Image(.glasshour)
                        .resizable()
                        .frame(width: 36 * 2, height: 50 * 2)
                        .offset(x: 30, y: 30)
                }
                
                Spacer()
                
                Button(action: {
                    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
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

#Preview {
    MakeLetterResultView(letterInfo: 
        MakeLetterState(
            senderName: "ddd",
            arrivalDate: Date(),
            messageContent: "퇴근마렵다",
            receiverName: "모카우유",
            eventType: .nonEvent
        )
    )
}
