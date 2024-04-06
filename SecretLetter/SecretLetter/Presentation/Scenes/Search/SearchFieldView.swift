//
//  SearchFieldView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/7/24.
//

import SwiftUI

struct SearchFieldView: View {
    
    @State private var keyword: String = ""
    
    var body: some View {
        ZStack {
            Image(.defaultBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            HStack {
                TextField("유저 검색", text: $keyword)
                    .accentColor(.black)
                    .frame(height: 30)
                    .modifier(RectangleStrokeModifier())
                
                NavigationLink(destination: {
                    SearchResultView(viewModel: SearchResultViewModel(nickname: keyword))
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .frame(width: 1, height: 30)
                        .modifier(RectangleStrokeModifier())
                })
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: 30)
            
        }
    }
}

#Preview {
    SearchFieldView()
}
