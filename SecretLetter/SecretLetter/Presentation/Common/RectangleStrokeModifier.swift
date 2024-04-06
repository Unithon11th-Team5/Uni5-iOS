//
//  RectangleStrokeModifier.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import SwiftUI

struct RectangleStrokeModifier: ViewModifier {
    
    var selectedColor = Color.white
      
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background {
                selectedColor
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.black)
                            .offset(CGSize(width: 0, height: 5))
                    }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.black, lineWidth: 1)
            }
    }
          
}

