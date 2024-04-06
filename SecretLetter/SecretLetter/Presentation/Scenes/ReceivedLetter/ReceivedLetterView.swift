//
//  ReceivedLetterView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct ReceivedLetterView: View {
    @StateObject var viewModel = ReceivedLetterViewModel()
    private var receivedLetters: [Letter] {
        viewModel.state.receivedLetters
    }
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 65)
            HStack {
                Text("수신함")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.text)
                Image(.glasshour)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
            }
            if viewModel.state.receivedLetters.isEmpty {
                Spacer()
                Image(.letter)
                Text("아직 받은 레터가 없어요~\n먼저 유니레터를 보내보는건 어때요?")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.text.opacity(0.5))
                Spacer()
            } else {
                ForEach(receivedLetters) { letter in
                    
                }
            }
        }
        .background(
            Image(.plainBackground)
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea()
        .onAppear(perform: { viewModel.trigger(.onAppear) })
    }
}

#Preview {
    ReceivedLetterView()
}
