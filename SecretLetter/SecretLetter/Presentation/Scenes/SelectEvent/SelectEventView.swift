//
//  SelectEventView.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import SwiftUI

enum EventType: String, CaseIterable {
    case cheerUp = "응원"
    case birthday = "생일"
    case chooseock = "추석"
    case christmas = "크리스마스"
    case nonEvent = "일상"
    case etc = "기타"
}

struct SelectEventView: View {
    var body: some View {
        VStack {
            Text("시크릿 메세지,\n왜 쓰러 오셨죠?")
                .font(.title)
            
        }
        .background(
            Image(.defaultBackground)
        )
    }
}

#Preview {
    SelectEventView()
}
