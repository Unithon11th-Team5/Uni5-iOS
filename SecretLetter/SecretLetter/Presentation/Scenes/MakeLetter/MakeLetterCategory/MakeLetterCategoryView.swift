//
//  MakeLetterCategoryView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import SwiftUI

struct MakeLetterCategoryView: View {
    
    @StateObject var viewModel: MakeLetterCategoryViewModel
    
    private var eventSelected: Bool {
        viewModel.state.selectedEvent != nil
    }
    
    private var selectedEvent: EventType? {
        if let selectedEventString = viewModel.state.selectedEvent {
            return EventType(rawValue: selectedEventString)
        }
        return nil
    }
    
    var body: some View {
        VStack {
            Text("원하는 이벤트를\n선택해 주세요.")
                .font(.system(size: 24, weight: .bold))
                .padding(.top, 50)
            Spacer()
            LazyVGrid(
                columns: [GridItem(), GridItem()],
                spacing: 12
            ) {
                ForEach(EventType.allCases) { type in
                    ZStack {
                        Rectangle()
                            .frame(height: 90)
                            .foregroundStyle(selectedEvent == type ? Color.accentColor : .white)
                            .modifier(RectangleStrokeModifier(selectedColor: selectedEvent == type ? .accentColor : .white))
                        VStack {
                            Text(type.korean)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.text)
                            Text(type.rawValue)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.text)
                        }
                    }
                    .onTapGesture {
                        viewModel.trigger(.selectEvent(type))
                    }
                }
            }
            .padding(.horizontal, 48)
            Spacer(minLength: 130)
            NavigationLink {
//                AddEventDetailView(viewModel: AddEventDetailViewModel(type: selectedEvent ?? EventType.cheerUp))
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 60)
                        .foregroundStyle(eventSelected ? Color.text : .disabledButtonBackground)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(eventSelected ? Color.clear : .disabledButtonStroke, lineWidth: 1.0)
                        )
                    Text(eventSelected ? "다음" : "전송")
                        .foregroundStyle(eventSelected ? .white : .gray)
                        .font(.system(size: 16, weight: .medium))
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
            }
            .disabled(!eventSelected)
        }
        .background(
            Image(.defaultBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    MakeLetterCategoryView(viewModel: MakeLetterCategoryViewModel(state: MakeLetterCategoryState()))
}
