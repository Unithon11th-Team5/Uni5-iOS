//
//  ReceivedLetterView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct ReceivedLetterView: View {
    var body: some View {
        ZStack {
            Image(.plainBackground)
                .ignoresSafeArea()
            
            Text("받은 편지 화면")
                .bold()
                .font(.title)
        }
    }
}

#Preview {
    ReceivedLetterView()
}
