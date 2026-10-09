//
//  LessonFormViewModel.swift
//  MindGray
//
import Foundation

@Observable
final class LessonFormViewModel {
    enum Mode {
        case creation
        case editing(Lesson)
    }

    private let repository: LessonRepository

    let mode: Mode

    var title: String = ""
    var detailsDescription: String = ""
    var reference: String = ""
    private(set) var details: [String] = []

    var newDetail: String = ""

    var onSaved: (() -> Void)?

    var canSave: Bool {
        !self.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !self.detailsDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    init(repository: LessonRepository) {
        self.repository = repository
        self.mode = .creation
    }

    init(repository: LessonRepository, lesson: Lesson) {
        self.repository = repository
        self.mode = .editing(lesson)
        self.title = lesson.title
        self.detailsDescription = lesson.detailsDescription
        self.reference = lesson.reference
        self.details = lesson.details
    }

    func addDetail() {
        let trimmed = self.newDetail.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        self.details.append(trimmed)
        self.newDetail = ""
    }

    func removeDetail(at offsets: IndexSet) {
        for index in offsets.sorted(by: >) {
            self.details.remove(at: index)
        }
    }

    func removeDetail(_ detail: String) {
        self.details.removeAll { $0 == detail }
    }

    func save() {
        guard self.canSave else { return }
        do {
            switch self.mode {
            case .creation:
                let lesson = Lesson(title: self.title, detailsDescription: self.detailsDescription, reference: self.reference, details: self.details)
                try self.repository.create(lesson)
            case .editing(let lesson):
                lesson.title = self.title
                lesson.detailsDescription = self.detailsDescription
                lesson.reference = self.reference
                lesson.details = self.details
                try self.repository.update(lesson)
            }
            self.reset()
            self.onSaved?()
        } catch {
            print("Error saving lesson:", error)
        }
    }

    func reset() {
        self.title = ""
        self.detailsDescription = ""
        self.reference = ""
        self.details = []
        self.newDetail = ""
    }
}
