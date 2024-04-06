//
//  MakeLetterView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct MakeLetterView: View {
    var body: some View {
        ZStack {
            Image(.plainBackground)
                .ignoresSafeArea()
            
            Text("편지 작성 화면")
                .bold()
                .font(.title)
        }
    }
}

#Preview {
    MakeLetterView()
}
