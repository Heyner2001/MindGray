//
//  LessonListViewModel.swift
//  MindGray
//

import Foundation

@Observable
final class LessonListViewModel {
    private let repository: LessonRepository

    private(set) var lessons: [Lesson] = []

    init(repository: LessonRepository) {
        self.repository = repository
    }

    func reload() {
        do {
            self.lessons = try self.repository.fetchAll()
        } catch {
            print("Error loading lessons:", error)
        }
    }
}
