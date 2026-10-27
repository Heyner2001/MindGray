//
//  ColorTokens.swift
//  MindGray
//

import SwiftUI

/// Light appearance only: the product is light-only for now, so no token
/// defines a dark variant. See .agents/skill/ui-design/SKILL.md.
enum ColorTokens {
    static let canvas = Color(hex: 0xE8E1D8)
    static let surface = Color(hex: 0xF2EDE7)

    static let textPrimary = Color(hex: 0x4A4749)
    static let textSecondary = Color(hex: 0x635F5F)

    static let accentWarm = Color(hex: 0xC97873)
    static let accentCool = Color(hex: 0xB9C8D4)
    static let accentNatural = Color(hex: 0x9DAF96)

    static let destructive = Color(hex: 0xB0574F)
}
