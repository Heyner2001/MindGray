//
//  LessonDetailView.swift
//  MindGray
//

import SwiftUI

struct LessonDetailView: View {
    let lesson: Lesson
    let repository: LessonRepository
    let onChanged: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var showDeleteAlert = false
    @State private var showEdit = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(lesson.title)
                    .font(.title)
                    .bold()

                Text(lesson.detailsDescription)

                if !lesson.reference.isEmpty {
                    Text(lesson.reference)
                        .foregroundStyle(.secondary)
                }

                if !lesson.details.isEmpty {
                    Text("Detalles")
                        .font(.headline)
                    ForEach(lesson.details, id: \.self) { detail in
                        Text("• \(detail)")
                    }
                }

                Text(lesson.creationDate, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button("Editar") { showEdit = true }
                    Button("Borrar", role: .destructive) { showDeleteAlert = true }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .sheet(isPresented: $showEdit) {
            LessonFormView(viewModel: LessonFormViewModel(repository: repository, lesson: lesson))
                .onDisappear { onChanged() }
        }
        .alert("¿Borrar esta reflexión?", isPresented: $showDeleteAlert) {
            Button("Cancelar", role: .cancel) {}
            Button("Borrar", role: .destructive) {
                do {
                    try repository.delete(lesson)
                    onChanged()
                    dismiss()
                } catch {
                    print("Error deleting lesson:", error)
                }
            }
        } message: {
            Text("Esta acción no se puede deshacer.")
        }
    }
}
