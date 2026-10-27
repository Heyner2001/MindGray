//
//  LessonFormView.swift
//  MindGray
//

import SwiftUI

struct LessonFormView: View {
    @State private var viewModel: LessonFormViewModel
    @Environment(\.dismiss) private var dismiss

    private var heading: String {
        switch viewModel.mode {
        case .creation:
            return "Nueva reflexión"
        case .editing:
            return "Editar reflexión"
        }
    }

    init(viewModel: LessonFormViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            List {
                headingRow()
                fieldRow("Título") {
                    TextField("Título de la reflexión", text: $viewModel.title)
                }
                fieldRow("Descripción") {
                    TextEditor(text: $viewModel.detailsDescription)
                        .frame(minHeight: 140)
                        .scrollContentBackground(.hidden)
                }
                labelRow("Detalles")
                ForEach(viewModel.details, id: \.self) { detail in
                    detailRow(detail)
                }
                .onDelete(perform: viewModel.removeDetail)
                addDetailRow()
                fieldRow("Referencia") {
                    TextField("Película, libro, persona, experiencia…", text: $viewModel.reference)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .frame(maxWidth: SpacingTokens.readingWidth)
            .background(ColorTokens.canvas.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Guardar") {
                        viewModel.save()
                        dismiss()
                    }
                    .font(TypographyTokens.button)
                    .tint(ColorTokens.accentWarm)
                    .disabled(!viewModel.canSave)
                }
            }
        }
    }

    private func headingRow() -> some View {
        Text(heading)
            .font(TypographyTokens.displayLarge)
            .foregroundStyle(ColorTokens.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, SpacingTokens.lg)
            .rowChrome()
    }

    private func labelRow(_ label: String) -> some View {
        Text(label)
            .font(TypographyTokens.supporting)
            .foregroundStyle(ColorTokens.textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .rowChrome()
    }

    private func fieldRow<Content: View>(_ label: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: SpacingTokens.sm) {
            Text(label)
                .font(TypographyTokens.supporting)
                .foregroundStyle(ColorTokens.textSecondary)

            content()
                .font(TypographyTokens.body)
                .foregroundStyle(ColorTokens.textPrimary)
                .tint(ColorTokens.accentWarm)

            hairline()
        }
        .rowChrome()
    }

    private func detailRow(_ detail: String) -> some View {
        VStack(alignment: .leading, spacing: SpacingTokens.sm) {
            HStack(spacing: SpacingTokens.sm) {
                Text(detail)
                    .font(TypographyTokens.body)
                    .foregroundStyle(ColorTokens.textPrimary)

                Spacer(minLength: SpacingTokens.sm)

                Button {
                    viewModel.removeDetail(detail)
                } label: {
                    Image(systemName: "xmark")
                        .font(TypographyTokens.supporting)
                        .foregroundStyle(ColorTokens.textSecondary)
                        .frame(minWidth: 44, minHeight: 44)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Eliminar detalle")
            }

            hairline()
        }
        .rowChrome()
    }

    private func addDetailRow() -> some View {
        VStack(alignment: .leading, spacing: SpacingTokens.sm) {
            HStack(spacing: SpacingTokens.sm) {
                TextField("Añadir detalle", text: $viewModel.newDetail)
                    .font(TypographyTokens.body)
                    .foregroundStyle(ColorTokens.textPrimary)
                    .tint(ColorTokens.accentWarm)
                    .onSubmit(viewModel.addDetail)

                Button(action: viewModel.addDetail) {
                    Image(systemName: "plus")
                        .font(TypographyTokens.supporting)
                        .foregroundStyle(ColorTokens.accentWarm)
                        .frame(minWidth: 44, minHeight: 44)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .disabled(viewModel.newDetail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                .accessibilityLabel("Añadir detalle")
            }

            hairline()
        }
        .rowChrome()
    }

    private func hairline() -> some View {
        Rectangle()
            .fill(ColorTokens.textSecondary.opacity(0.25))
            .frame(height: StrokeTokens.hairline)
    }
}

private extension View {
    func rowChrome() -> some View {
        self
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(
                top: SpacingTokens.sm,
                leading: SpacingTokens.screenMargin,
                bottom: SpacingTokens.sm,
                trailing: SpacingTokens.screenMargin
            ))
    }
}
