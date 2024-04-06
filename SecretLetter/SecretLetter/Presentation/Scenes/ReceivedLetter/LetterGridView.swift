//
//  LetterGridView.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import SwiftUI

struct LetterGridView: View {
    
    var multiply: CGFloat = 1.0
    
    let backgroundColor: Color
    let letter: Letter
    let receiverName: String
    
    init(multiply: CGFloat = 1.0, backgroundColor: Color, letter: Letter, receiverName: String = "지영") {
        self.multiply = multiply
        self.backgroundColor = backgroundColor
        self.receiverName = receiverName
        self.letter = letter
    }
    
    var body: some View {
        VStack {
            Text("TO. \(receiverName)")
                .font(.system(size: 10 * multiply, weight: .black))
                .foregroundStyle(.black)
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                    .modifier(RectangleStrokeModifier())
                Text(letter.content)
                    .font(.system(size: 10 * multiply, weight: .bold))
                    .foregroundStyle(.black)
                    .lineLimit(2)
                    .padding(.horizontal, 12 * multiply)
            }
            .padding(.vertical, 5 * multiply)
            .padding(.bottom, 5 * multiply)
            
            Text("FROM. \(letter.senderName)")
                .font(.system(size: 10 * multiply, weight: .black))
                .foregroundStyle(.black)
        }
        .padding(20 * multiply)
        .frame(width: 160 * multiply, height: 140 * multiply)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(backgroundColor)
                .shadow(color: .black.opacity(0.15), radius: 10 * multiply, y: 4 * multiply)
        )
    }
}
