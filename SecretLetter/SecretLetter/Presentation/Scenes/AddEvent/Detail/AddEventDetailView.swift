//
//  AddEventDetailView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct AddEventDetailView: View {
    
    @StateObject var viewModel: AddEventDetailViewModel
    @State private var navigationAction: Bool? = false
    
    var body: some View {
        ZStack {
            
            NavigationLink(
                destination: AddEventCompleteView(),
                tag: true,
                selection: $viewModel.navigationAction) {
                EmptyView()
            }
            
            Image(.defaultBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(spacing: 42.5) {
                Text("이벤트 상세 내용을\n 기입해주세요")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .bold()
                
                VStack(spacing: 16) {
                    eventTypeView
                    eventDateView
                        .onTapGesture {
                            viewModel.isShowCalendarPopup = true
                        }
                    eventContentView
                }
                .frame(maxWidth: 350)
                
                Spacer().frame(height: 200)
                
                sendButton
            }
        }
        
        // 캘린더 팝업
        .popup(isPresented: $viewModel.isShowCalendarPopup) {
            calendarPopupView
        } customize: {
            $0.closeOnTap(false)
                .backgroundColor(.black.opacity(0.4))
        }
    }
}

extension AddEventDetailView {
    var eventTypeView: some View {
        HStack {
            Text(viewModel.state.eventType.korean)
                .bold()
                .foregroundStyle(.black)

            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding(8)
        .modifier(RectangleStrokeModifier())
    }
    
    var eventDateView: some View {
        HStack {
            Text(DateHelper.shared.dateToString(date: viewModel.state.date))
                .foregroundStyle(.black)
                .bold()
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding(8)
        .modifier(RectangleStrokeModifier())
    }
        
    var eventContentView: some View {
        HStack {
            TextField("이벤트 목적 입력", text: $viewModel.state.content)
                .accentColor(.black)
                .bold()
                .foregroundStyle(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding(8)
        .modifier(RectangleStrokeModifier())
    }

}

extension AddEventDetailView {
    var sendButton: some View {
        Button(action: {
            self.viewModel.trigger(.nextButtonTapped)
        }, label: {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black, lineWidth: 1)
                .fill(viewModel.isNextButtonActive ? .black : .disabledButtonBackground )
                .frame(width: 350, height: 60)
                .overlay(alignment: .center) {
                    Text("다음")
                        .foregroundStyle(viewModel.isNextButtonActive ? .white : .disabledButtonStroke)
                }
        })
        .disabled(!viewModel.isNextButtonActive)
    }
}

extension AddEventDetailView {
    var calendarPopupView: some View {
        VStack {
            DatePicker(
                "도착 시간",
                selection: $viewModel.state.date,
                displayedComponents: .date
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .accentColor(.calendarAccent)
                
            
            Button(action: {
                viewModel.isShowCalendarPopup = false
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
    AddEventDetailView(viewModel: AddEventDetailViewModel(type: .cheerUp))
}
