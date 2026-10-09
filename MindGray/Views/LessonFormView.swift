//
//  LessonFormView.swift
//  MindGray
//

import SwiftUI

struct LessonFormView: View {
    @State private var viewModel: LessonFormViewModel
    @Environment(\.dismiss) private var dismiss

    init(viewModel: LessonFormViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Título") {
                    TextField("Título de la reflexión", text: $viewModel.title)
                }

                Section("Descripción") {
                    TextEditor(text: $viewModel.detailsDescription)
                        .frame(height: 200)
                        .scrollContentBackground(.hidden)
                }

                Section("Detalles") {
                    HStack {
                        TextField("Añadir detalle", text: $viewModel.newDetail)
                        Button(action: viewModel.addDetail) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.gray)
                        }
                        .disabled(viewModel.newDetail.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }

                    ForEach(viewModel.details, id: \.self) { detail in
                        HStack {
                            Text(detail)
                            Spacer()
                            Button {
                                viewModel.removeDetail(detail)
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.gray)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .onDelete(perform: viewModel.removeDetail)
                }

                Section("Referencia") {
                    TextField("Película, libro, persona, experiencia…", text: $viewModel.reference)
                }
            }
            .navigationTitle("Nueva lección")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Guardar") {
                        viewModel.save()
                        if case .editing = viewModel.mode {
                            dismiss()
                        }
                    }
                        .disabled(!viewModel.canSave)
                }
            }
        }
    }
}
