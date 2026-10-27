//
//  TypographyTokens.swift
//  MindGray
//

import SwiftUI

enum TypographyTokens {
    /// Serif used only for display headings, never for body text or controls.
    private static let serif = "CormorantGaramond-Medium"
    private static let serifRegular = "CormorantGaramond-Regular"

    static let displayLarge = Font.custom(serif, size: 34, relativeTo: .largeTitle)
    static let display = Font.custom(serif, size: 28, relativeTo: .title)
    static let sectionTitle = Font.custom(serif, size: 24, relativeTo: .title2)

    /// Quotations and reflective fragments. Regular weight; there is no italic cut.
    static let quote = Font.custom(serifRegular, size: 22, relativeTo: .title3)

    static let body = Font.system(.body)
    static let callout = Font.system(.callout)
    static let supporting = Font.system(.subheadline)
    static let caption = Font.system(.caption)
    static let button = Font.system(.body).weight(.medium)
}
