//
//  DeveloperPreview.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 07/03/2024.
//

import Foundation
import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}


class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Hussein Muktar", email: "hussein@test.com", username: "hussein")
    
    let thread = Thread(ownerUID: UUID().uuidString, caption: "First thread", timestamp: Timestamp(), likes: 0)
}
