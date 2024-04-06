//
//  SingleLetterView.swift
//  SecretLetter
//
//  Created by 제나 on 4/7/24.
//

import SwiftUI

struct SingleLetterView: View {
    let letter: Letter
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.white)
                .modifier(RectangleStrokeModifier())
            VStack(spacing: 20) {
                HStack(spacing: 8) {
                    if let type = EventType(rawValue: letter.type) {
                        Text(type.korean)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.black)
                            .padding(8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.accent)
                            )
                    }
                    Text("FROM. \(letter.senderName)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.black)
                    Text(letter.sentAt.replacingOccurrences(of: "-", with: "."))
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.black)
                }
                HStack {
                    Text(letter.content)
                        .font(.system(size: 14, weight: .medium))
                        .padding(.top, 20)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.horizontal, 24)
                Spacer()
                HStack {
                    Spacer()
                    Text("\(letter.content.count)/300")
                        .font(.system(size: 12, weight: .medium))
                        .padding(.trailing)
                }
            }
            .padding(.vertical, 24)
        }
        .padding(.horizontal, 14)
    }
}
