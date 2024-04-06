//
//  LetterGridView.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import SwiftUI

struct LetterGridView: View {
    let backgroundColor: Color
    let letter: Letter
    var body: some View {
        VStack {
            Text("TO. 지영")
                .font(.system(size: 10, weight: .black))
                .foregroundStyle(.black)
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                    .modifier(RectangleStrokeModifier())
                Text(letter.content)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.black)
                    .lineLimit(2)
                    .padding(.horizontal, 12)
            }
            .padding(.vertical, 5)
            .padding(.bottom, 5)
            
            Text("FROM. \(letter.senderName)")
                .font(.system(size: 10, weight: .black))
                .foregroundStyle(.black)
        }
        .padding(20)
        .frame(width: 160, height: 140)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(backgroundColor)
                .shadow(color: .black.opacity(0.15), radius: 10, y: 4)
        )
    }
}
