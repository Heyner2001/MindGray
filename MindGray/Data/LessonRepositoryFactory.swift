//
//  LessonRepositoryFactory.swift
//  MindGray
//

import Foundation
import SwiftData

struct LessonRepositoryFactory {
    private let context: ModelContext

    init() {
        let container = Self.makeContainer()
        self.context = ModelContext(container)
    }

    func make() -> LessonRepository {
        // Today: local persistence. To switch to remote, return a RemoteLessonRepository here.
        SwiftDataLessonRepository(context: context)
    }

    private static func makeContainer() -> ModelContainer {
        do {
            return try ModelContainer(for: Lesson.self)
        } catch {
            print("Error creating ModelContainer:", error)
            deleteStoreFiles()
            do {
                return try ModelContainer(for: Lesson.self)
            } catch {
                print("Error recreating ModelContainer, falling back to in-memory store:", error)
                do {
                    return try ModelContainer(for: Lesson.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
                } catch {
                    fatalError("Unable to create any ModelContainer: \(error)")
                }
            }
        }
    }

    private static func deleteStoreFiles() {
        guard let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else { return }
        let storeNames = ["default.store", "default.store-wal", "default.store-shm"]
        for name in storeNames {
            try? FileManager.default.removeItem(at: url.appendingPathComponent(name))
        }
    }
}
