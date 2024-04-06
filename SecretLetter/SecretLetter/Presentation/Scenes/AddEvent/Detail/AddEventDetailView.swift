//
//  AddEventDetailView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct AddEventDetailView: View {
    
    @StateObject var viewModel: AddEventDetailViewModel
    
    var body: some View {
        Text("이벤트 상세 내용을 기입해주세요")
    }
}

#Preview {
    AddEventDetailView(viewModel: AddEventDetailViewModel(state: AddEventDetailState()))
}
