//
//  LessonFormViewModel.swift
//  MindGray
//
import Foundation

@Observable
final class LessonFormViewModel {
    var title: String = ""
    var desc: String = ""
    var reference: String = ""
    var details: [String] = []

    var newDetail: String = ""

    var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !desc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
        // Por ahora solo registramos en consola; la persistencia se añadirá en la siguiente fase.
        print("Lesson guardada:", title, desc, details, reference)
        reset()
    }

    func reset() {
        title = ""
        desc = ""
        reference = ""
        details = []
        newDetail = ""
    }
}
