//
//  LessonFormViewModel.swift
//  MindGray
//
import Foundation

@Observable
final class LessonFormViewModel {
    private let repository: LessonRepository

    var title: String = ""
    var detailsDescription: String = ""
    var reference: String = ""
    var details: [String] = []

    var newDetail: String = ""

    init(repository: LessonRepository) {
        self.repository = repository
    }

    var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !detailsDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func addDetail() {
        let trimmed = newDetail.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        details.append(trimmed)
        newDetail = ""
    }

    func removeDetail(at offsets: IndexSet) {
        for index in offsets.sorted(by: >) {
            details.remove(at: index)
        }
    }

    func removeDetail(_ detail: String) {
        details.removeAll { $0 == detail }
    }

    func save() {
        guard canSave else { return }
        let lesson = Lesson(title: title, detailsDescription: detailsDescription, reference: reference, details: details)
        do {
            try repository.create(lesson)
            reset()
        } catch {
            print("Error al guardar la lección:", error)
        }
    }

    func reset() {
        title = ""
        detailsDescription = ""
        reference = ""
        details = []
        newDetail = ""
    }
}
