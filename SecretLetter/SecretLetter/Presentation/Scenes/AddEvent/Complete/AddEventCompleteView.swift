//
//  AddEventCompleteView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

struct AddEventCompleteView: View {
    
    @StateObject var viewModel: AddEventCompleteViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddEventCompleteView(viewModel: AddEventCompleteViewModel(state: AddEventCompleteState()))
}
