//
//  LessonRepository.swift
//  MindGray
//

import Foundation

protocol LessonRepository {
    func fetchAll() throws -> [Lesson]
    func create(_ lesson: Lesson) throws
    func update(_ lesson: Lesson) throws
    func delete(_ lesson: Lesson) throws
}
