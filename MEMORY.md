# MindGray - MEMORY
Project memory between sessions. Max ~50 lines: review or remove what isn't important.

## Current state:
- V2: Lesson persistence with SwiftData (local), merged to master via PR #2
- Repository protocol + SwiftDataLessonRepository + LessonRepositoryFactory
- Form saves lessons locally; data persisted on device
- Current branch: task/005-lessons-list @ fbe91bc: list/detail/empty-state views committed. No tests, no linter, no CI

## Decisions:
- No third-party dependencies
- Style (CODE_CONVENTIONS.md): properties (stored+computed) before initializers, except View `body` (goes after init); use `self.` in classes, in structs only inside initializers; ViewModel state is `private(set)`, named after its data; mutually exclusive states use a single enum
- Persistence layer could change
- LessonRepositoryFactory owns ModelContainer/ModelContext creation; fallback chain: normal → delete store & retry → in-memory (never crash). ContentView no longer touches SwiftData
- Future: if we use @Query in the collection view, expose the factory's ModelContainer to the SwiftUI environment then

## Lessons and mistakes to avoid
(Do not apply)

## Next steps:
- Review/merge task/005 (list/detail views) into master
- Possibly swap factory to RemoteLessonRepository in the future