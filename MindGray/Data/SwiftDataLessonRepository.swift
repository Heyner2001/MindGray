//
//  SwiftDataLessonRepository.swift
//  MindGray
//

import Foundation
import SwiftData

final class SwiftDataLessonRepository: LessonRepository {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchAll() throws -> [Lesson] {
        let descriptor = FetchDescriptor<Lesson>(sortBy: [SortDescriptor(\.creationDate, order: .reverse)])
        return try self.context.fetch(descriptor)
    }

    func create(_ lesson: Lesson) throws {
        self.context.insert(lesson)
        try self.context.save()
    }

    func update(_ lesson: Lesson) throws {
        lesson.lastUpdated = Date()
        try self.context.save()
    }

    func delete(_ lesson: Lesson) throws {
        self.context.delete(lesson)
        try self.context.save()
    }
}
