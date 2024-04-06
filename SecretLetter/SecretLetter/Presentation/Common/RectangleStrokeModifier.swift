//
//  RectangleStrokeModifier.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import Foundation
import SwiftUI

struct RectangleStrokeModifier: ViewModifier {
      
    func body(content: Content) -> some View {
        
        content
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
            .background {
                Color.white
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

