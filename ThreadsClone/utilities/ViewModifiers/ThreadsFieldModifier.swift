//
//  ThreadsFieldModifier.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 01/03/2024.
//

import Foundation
import SwiftUI

struct ThreadsFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
