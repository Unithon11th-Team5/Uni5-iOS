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
                    .modifier(RectangleStrokeModifier())
                
                NavigationLink(destination: {
                    Text(keyword)
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .modifier(RectangleStrokeModifier())

                })
            }
            .frame(width: UIScreen.main.bounds.width - 100, height: 50)
            
        }
    }
}

#Preview {
    SearchFieldView()
}
