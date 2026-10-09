//
//  ContentView.swift
//  MindGray
//
//  Created by Heyner on 2/10/26.
//

import SwiftUI

struct ContentView: View {
    private let repository: LessonRepository
    @State private var listViewModel: LessonListViewModel

    init(repository: LessonRepository) {
        self.repository = repository
        _listViewModel = State(initialValue: LessonListViewModel(repository: repository))
    }

    var body: some View {
        Group {
            if listViewModel.lessons.isEmpty {
                let formViewModel = LessonFormViewModel(repository: repository)
                LessonFormView(viewModel: formViewModel)
                    .onAppear {
                        formViewModel.onSaved = { listViewModel.reload() }
                    }
            } else {
                LessonListView(viewModel: listViewModel, repository: repository)
            }
        }
        .onAppear { listViewModel.reload() }
    }
}
