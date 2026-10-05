# MindGray - MEMORY
Project memory between sessions. Max ~50 lines: review or remove what isn't important.

## Current state:
- V2: Lesson persistence with SwiftData (local). Repository protocol + SwiftDataLessonRepository + LessonRepositoryFactory
- Form saves lessons locally; data persisted on device
- Branch task/003: 2 commits (persistence feature + AGENTS/MEMORY config), PR open
- No tests, no linter, no CI configured

## Decisions:
- No third-party dependencies
- Persistence layer could change
- LessonRepositoryFactory owns ModelContainer/ModelContext creation; fallback chain: normal → delete store & retry → in-memory (never crash). ContentView no longer touches SwiftData
- Future: if we use @Query in the collection view, expose the factory's ModelContainer to the SwiftUI environment then

## Lessons and mistakes to avoid
(Do not apply)

## Next steps:
- Lesson collection list view (fetch from repository)
- Edit/delete saved lessons
- Possibly swap factory to RemoteLessonRepository in the future