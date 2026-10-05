//
//  ContentView.swift
//  MindGray
//
//  Created by Heyner on 2/10/26.
//

import SwiftUI

struct ContentView: View {
    private let factory = LessonRepositoryFactory()

    var body: some View {
        LessonFormView(viewModel: LessonFormViewModel(repository: factory.make()))
    }
}
