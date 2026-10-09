//
//  MindGrayApp.swift
//  MindGray
//
//  Created by Heyner on 2/10/26.
//

import SwiftUI

@main
struct MindGrayApp: App {
    private let repositoryFactory = LessonRepositoryFactory()

    var body: some Scene {
        WindowGroup {
            ContentView(repository: repositoryFactory.make())
        }
    }
}
