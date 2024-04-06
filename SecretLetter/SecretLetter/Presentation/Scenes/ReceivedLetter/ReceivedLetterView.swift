//
//  ReceivedLetterView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI
import PopupView

struct ReceivedLetterView: View {
    @StateObject var viewModel = ReceivedLetterViewModel()
    private var receivedLetters: [Letter] {
        viewModel.state.receivedLetters
    }
    @State private var index = 0
    var body: some View {
        ZStack {
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
                    ScrollView {
                        let backgroundColors = [
                            Color.accentColor,
                            Color.gridBackgroundColor2,
                            Color.gridBackgroundColor3,
                            Color.white
                        ]
                        LazyVGrid(
                            columns: [GridItem(), GridItem()],
                            spacing: 16
                        ) {
                            ForEach(0..<viewModel.state.receivedLetters.count, id: \.self) { index in
                                let bgColor = backgroundColors[index % 4]
                                let receiverName = UserDefaults.standard.string(forKey: "name")
                                LetterGridView(
                                    backgroundColor: bgColor,
                                    letter: receivedLetters[index],
                                    receiverName: receiverName ?? "나"
                                )
                                .onTapGesture {
                                    viewModel.trigger(.clickedLetterGrid(receivedLetters[index].id))
                                }
                            }
                        }
                        .padding(20)
                        .safeAreaInset(edge: .bottom, content: {
                            Spacer().frame(height: 100)
                        })
                    }
                }
            }
            
            if viewModel.state.showPopUp {
                Color.black.opacity(0.4)
            }
        }
        .background(
            Image(.plainBackground)
                .resizable()
                .scaledToFill()
        )
        .ignoresSafeArea()
        .onAppear(perform: { viewModel.trigger(.onAppear) })
        .popup(isPresented: $viewModel.state.showPopUp) {
            TabView {
                ForEach(receivedLetters) { letter in
                    SingleLetterView(letter: letter)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .background(Color.clear)
            .padding(.horizontal, 14)
            .frame(height: 380)
        } customize: {
            $0.closeOnTapOutside(true)
        }
    }
}
