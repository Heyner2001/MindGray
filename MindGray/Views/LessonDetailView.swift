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
            VStack(alignment: .leading, spacing: SpacingTokens.lg) {
                Text(lesson.title)
                    .font(TypographyTokens.displayLarge)
                    .foregroundStyle(ColorTokens.textPrimary)
                    .padding(.top, SpacingTokens.xxl)

                Text(lesson.detailsDescription)
                    .font(TypographyTokens.body)
                    .foregroundStyle(ColorTokens.textPrimary)
                    .lineSpacing(SpacingTokens.sm)

                if !lesson.reference.isEmpty {
                    quotation(lesson.reference)
                }

                if !lesson.details.isEmpty {
                    VStack(alignment: .leading, spacing: SpacingTokens.md) {
                        Text("Detalles")
                            .font(TypographyTokens.sectionTitle)
                            .foregroundStyle(ColorTokens.textPrimary)

                        ForEach(lesson.details, id: \.self) { detail in
                            HStack(alignment: .top, spacing: SpacingTokens.sm) {
                                Circle()
                                    .strokeBorder(ColorTokens.accentNatural, lineWidth: StrokeTokens.fine)
                                    .frame(width: 7, height: 7)
                                    .padding(.top, SpacingTokens.xs)

                                Text(detail)
                                    .font(TypographyTokens.body)
                                    .foregroundStyle(ColorTokens.textPrimary)
                            }
                        }
                    }
                    .padding(.top, SpacingTokens.sm)
                }

                Text(lesson.creationDate, style: .date)
                    .font(TypographyTokens.caption)
                    .foregroundStyle(ColorTokens.textSecondary)
                    .padding(.top, SpacingTokens.sm)
            }
            .padding(SpacingTokens.screenMargin)
            .frame(maxWidth: SpacingTokens.readingWidth, alignment: .leading)
            .frame(maxWidth: .infinity)
        }
        .background(ColorTokens.canvas.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button("Editar") { showEdit = true }
                    Button("Borrar", role: .destructive) { showDeleteAlert = true }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
                .tint(ColorTokens.textSecondary)
                .accessibilityLabel("Opciones")
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

    /// The reference reads as a quotation: serif text marked by a fine leading rule.
    private func quotation(_ text: String) -> some View {
        HStack(alignment: .top, spacing: SpacingTokens.md) {
            Rectangle()
                .fill(ColorTokens.accentWarm.opacity(0.5))
                .frame(width: StrokeTokens.hairline)

            Text(text)
                .font(TypographyTokens.quote)
                .foregroundStyle(ColorTokens.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
