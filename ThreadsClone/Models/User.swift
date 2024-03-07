//
//  User.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 06/03/2024.
//

import Foundation


// user data model
struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let username: String
    var profileImageURL: String?
    var bio: String?
}
