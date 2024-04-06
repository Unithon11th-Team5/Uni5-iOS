//
//  SecretLetterApp.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI

@main
struct SecretLetterApp: App {
    var body: some Scene {
        WindowGroup {
            MakeLetterView(viewModel: MakeLetterViewModel(senderName: "Unithon"))
        }
    }
}
