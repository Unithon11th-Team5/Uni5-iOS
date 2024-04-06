//
//  SelectEventView.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import SwiftUI

enum EventType: String, CaseIterable, Identifiable {
    case cheerUp
    case birthday
    case chooseock
    case christmas
    case nonEvent
    case etc
    
    var id: String {
        self.rawValue
    }
    
    var korean: String {
        switch self {
        case .cheerUp:
            "응원"
        case .birthday:
            "생일"
        case .chooseock:
            "추석"
        case .christmas:
            "크리스마스"
        case .nonEvent:
            "일상"
        case .etc:
            "기타"
        }
    }
}

struct SelectEventView: View {
    @StateObject var viewModel = SelectEventViewModel()
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
            Text(eventSelected ? "원하는 이벤트를\n선택해 주세요." : "시크릿 메세지,\n왜 쓰러 오셨죠?")
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
            Button {
                // TODO: - 네비게이션 구현
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
    SelectEventView()
}
