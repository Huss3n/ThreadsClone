//
//  Timestamp.swift
//  ThreadsClone
//
//  Created by Muktar Hussein on 14/03/2024.
//

import Foundation
import Firebase


extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
