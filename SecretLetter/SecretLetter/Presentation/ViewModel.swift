//
//  ViewModel.swift
//  SecretLetter
//
//  Created by 제나 on 4/6/24.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject {
    associatedtype State
    associatedtype Input

    var state: State { get }
    func trigger(_ input: Input)
}
