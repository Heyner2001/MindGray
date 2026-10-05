//
//  Lesson.swift
//  MindGray
//

import Foundation
import SwiftData

@Model
final class Lesson {
    var id: UUID
    var title: String
    var detailsDescription: String
    var reference: String
    var details: [String]
    var creationDate: Date
    var lastUpdated: Date

    init(title: String, detailsDescription: String, reference: String, details: [String] = []) {
        self.id = UUID()
        self.title = title
        self.detailsDescription = detailsDescription
        self.reference = reference
        self.details = details
        self.creationDate = Date()
        self.lastUpdated = Date()
    }
}
