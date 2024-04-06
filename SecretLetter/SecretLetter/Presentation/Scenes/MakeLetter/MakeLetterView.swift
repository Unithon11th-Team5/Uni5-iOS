//
//  MakeLetterView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI
import PopupView

struct MakeLetterView: View {
    
    @StateObject var viewModel: MakeLetterViewModel
    
    var body: some View {
        ZStack {
            
            // BackgroundView
            Image(.defaultBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
            // ContentView
            VStack(spacing: 0) {
                
                Spacer().frame(height: 48)
                
                Text("수신자에게 보낼 메세지를 작성해보세요")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.title)
                
                Spacer().frame(height: 44)
                
                messageFieldView
                
                Spacer().frame(height: 16)
                receiverNameField
                Spacer().frame(height: 24)
                sendButton
                Spacer().frame(height: 48)
            }
        }
        .popup(isPresented: $viewModel.isShowCalanderPopup) {
            calendarPopupView
        } customize: {
            $0.closeOnTap(false)
                .backgroundColor(.black.opacity(0.4))
        }
    }
}

// MARK: Contents
extension MakeLetterView {
    var messageFieldView: some View {
        VStack {
            invoiceView
            Spacer()
            messageContentView
            Spacer()
            isToMeView
        }
        .padding(.vertical)
        .frame(width: 300, height: 400)
        .modifier(RectangleStrokeModifier())
    }
    
    var invoiceView: some View {
        HStack {
            HStack {
                Text("From. ")
                TextField("보내는 사람", text: $viewModel.state.senderName)
                    .accentColor(.black)
            }
            .bold()
            
            Spacer()
            
            Button(action: {
                viewModel.isShowCalanderPopup.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.accent)
                    .frame(width: 32, height: 32)
                    .overlay(alignment: .center) {
                        Image(systemName: "calendar")
                            .foregroundStyle(.black)
                    }
            })
        }
    }
    
    var messageContentView: some View {
        TextField("메세지를 작성해 보세요", text: $viewModel.state.messageContent)
            .accentColor(.black)
    }
    
    var isToMeView: some View {
        HStack {
            HStack {
                Button(action: {
                    self.viewModel.state.isToMyself.toggle()
                }, label: {
                    Circle()
                        .stroke(viewModel.state.isToMyself ? .accent : .gray, lineWidth: 3)
                        .fill(viewModel.state.isToMyself ? .accent : .white)
                        .frame(width: 18, height: 18)
                        .overlay(alignment: .center) {
                            if viewModel.state.isToMyself {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    
                })
                
                Button(action: {
                    self.viewModel.state.isToMyself.toggle()
                }, label: {
                    Text("나에게 쓰기")
                        .foregroundStyle(.text)
                        .bold()
                })
                
                Spacer()
            }
        }
    }
    
    var receiverNameField: some View {
        TextField("받는사람 ID를 입력하세요", text: $viewModel.state.receiverName)
            .accentColor(.black)
            .multilineTextAlignment(.center)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .modifier(RectangleStrokeModifier())
            )
            .frame(width: 350, height: 60)
    }
    
    var sendButton: some View {
        Button(action: {
            self.viewModel.trigger(.sendButtonTapped)
        }, label: {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black, lineWidth: 1)
                .fill(viewModel.isButtonActivated ? .black : .disabledButtonBackground )
                .frame(width: 350, height: 60)
                .overlay(alignment: .center) {
                    Text("전송")
                        .foregroundStyle(viewModel.isButtonActivated ? .white : .disabledButtonStroke)
                }
        })
    }
}

// MARK: Popup
extension MakeLetterView {
    var calendarPopupView: some View {
        VStack {
            DatePicker(
                "도착 시간",
                selection: $viewModel.state.arrivalDate,
                displayedComponents: .date
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .accentColor(.calendarAccent)
                
            
            Button(action: {
                viewModel.isShowCalanderPopup.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.black)
                    .frame(width: 350, height: 60)
                    .overlay(alignment: .center) {
                        Text("확인")
                            .foregroundStyle(.white)
                    }
            })
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        )
    }
}

#Preview {
    MakeLetterView(viewModel: MakeLetterViewModel(senderName: "보내는사람"))
}
