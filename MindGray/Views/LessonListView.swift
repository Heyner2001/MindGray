//
//  LessonListView.swift
//  MindGray
//

import SwiftUI

struct LessonListView: View {
    @State private var viewModel: LessonListViewModel
    private let repository: LessonRepository

    /// Screen header drawn by the app instead of the system bar, so the title and
    /// the ring motif sit together and the list starts right below them.
    private var header: some View {
        HStack(spacing: SpacingTokens.md) {
            Text("Reflexiones")
                .font(TypographyTokens.displayLarge)
                .foregroundStyle(ColorTokens.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)

            NavigationLink {
                LessonFormView(viewModel: LessonFormViewModel(repository: repository))
                    .onDisappear { viewModel.reload() }
            } label: {
                ZStack {
                    RingsMotif()

                    Image(systemName: "plus")
                        .font(TypographyTokens.button)
                        .foregroundStyle(ColorTokens.accentWarm)
                }
                .offset(x: SpacingTokens.xxl)
                .contentShape(Circle())
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Nueva reflexión")
        }
        .padding(.horizontal, SpacingTokens.screenMargin)
        .padding(.vertical, SpacingTokens.sm)
        .background(ColorTokens.canvas)
    }

    init(viewModel: LessonListViewModel, repository: LessonRepository) {
        _viewModel = State(initialValue: viewModel)
        self.repository = repository
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.lessons) { lesson in
                    NavigationLink {
                        LessonDetailView(lesson: lesson, repository: repository, onChanged: viewModel.reload)
                    } label: {
                        lessonRow(for: lesson)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparatorTint(ColorTokens.textSecondary.opacity(0.25))
                    .listRowInsets(EdgeInsets(
                        top: SpacingTokens.md,
                        leading: SpacingTokens.screenMargin,
                        bottom: SpacingTokens.md,
                        trailing: SpacingTokens.screenMargin
                    ))
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .toolbar(.hidden, for: .navigationBar)
            .frame(maxWidth: SpacingTokens.readingWidth)
            .safeAreaInset(edge: .top, spacing: 0) { header }
            .background(ColorTokens.canvas.ignoresSafeArea())
            .onAppear { viewModel.reload() }
        }
    }

    private func lessonRow(for lesson: Lesson) -> some View {
        VStack(alignment: .leading, spacing: SpacingTokens.xs) {
            Text(lesson.title)
                .font(TypographyTokens.sectionTitle)
                .foregroundStyle(ColorTokens.textPrimary)

            Text(lesson.creationDate.timeAgo)
                .font(TypographyTokens.caption)
                .foregroundStyle(ColorTokens.textSecondary)
        }
        .padding(.vertical, SpacingTokens.xs)
    }
}

/// Original, purely atmospheric ring motif. It never carries information.
private struct RingsMotif: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(ColorTokens.accentCool, lineWidth: StrokeTokens.hairline)
                .frame(width: 96, height: 96)

            Circle()
                .strokeBorder(ColorTokens.accentCool.opacity(0.8), lineWidth: StrokeTokens.fine)
                .frame(width: 68, height: 68)

            Circle()
                .strokeBorder(ColorTokens.accentCool.opacity(0.6), lineWidth: StrokeTokens.ring)
                .frame(width: 40, height: 40)
        }
        .accessibilityHidden(true)
    }
}
