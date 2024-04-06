//
//  AddEventCategoryView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct AddEventCategoryView: View {
    
    @StateObject var viewModel: AddEventCategoryViewModel
    
    var body: some View {
        Text("새로 생성하는 이벤트의 목적은 무엇인가요?")
    }
}

#Preview {
    AddEventCategoryView(viewModel: AddEventCategoryViewModel(state: AddEventCategoryState()))
}
