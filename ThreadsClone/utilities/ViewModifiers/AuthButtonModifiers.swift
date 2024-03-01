//
//  AuthButtonModifiers.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import SwiftUI

struct AuthButtonModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 352, height: 44)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
