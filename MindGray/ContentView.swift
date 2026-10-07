//
//  ContentView.swift
//  MindGray
//
//  Created by Heyner on 2/10/26.
//

import SwiftUI

struct ContentView: View {
    private let viewModel: LessonFormViewModel

    init(viewModel: LessonFormViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        LessonFormView(viewModel: viewModel)
    }
}
