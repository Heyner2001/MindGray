//
//  LessonListView.swift
//  MindGray
//

import SwiftUI

struct LessonListView: View {
    @State private var viewModel: LessonListViewModel
    private let repository: LessonRepository

    init(viewModel: LessonListViewModel, repository: LessonRepository) {
        _viewModel = State(initialValue: viewModel)
        self.repository = repository
    }

    var body: some View {
        NavigationStack {
            List(viewModel.lessons) { lesson in
                NavigationLink(value: lesson) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(lesson.title)
                        Text(lesson.creationDate.timeAgo)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Reflexiones")
            .navigationDestination(for: Lesson.self) { lesson in
                LessonDetailView(lesson: lesson, repository: repository, onChanged: viewModel.reload)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        LessonFormView(viewModel: LessonFormViewModel(repository: repository))
                            .onDisappear { viewModel.reload() }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear { viewModel.reload() }
        }
    }
}
