//
//  MotionTokens.swift
//  MindGray
//

import SwiftUI

enum MotionTokens {
    static let quickDuration: Double = 0.2
    static let standardDuration: Double = 0.3
    static let transitionDuration: Double = 0.45

    /// Returns `nil` when the user has Reduce Motion enabled, so views only
    /// animate when it is safe to do so.
    static func quick(reduceMotion: Bool) -> Animation? {
        reduceMotion ? nil : .easeInOut(duration: quickDuration)
    }

    static func standard(reduceMotion: Bool) -> Animation? {
        reduceMotion ? nil : .easeInOut(duration: standardDuration)
    }

    static func transition(reduceMotion: Bool) -> Animation? {
        reduceMotion ? nil : .easeInOut(duration: transitionDuration)
    }
}
