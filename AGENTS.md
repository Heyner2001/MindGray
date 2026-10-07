# MindGray
Personal journal app ("journey app") for reflections and wisdom.

## Stack and structure
- SwiftUI iOS only.
- MVVM Architecture (Not pure)
- Data persistence with SwiftData
- Keep each layer decoupled (e.g., the View layer shouldn't import SwiftData)
- SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor and SWIFT_APPROACHABLE_CONCURRENCY = YES: types are MainActor by default; @Observable view models work out of the box.

## Conventions
- UI language is Spanish (labels, section titles, button text). Keep it consistent.
- For each new feature, ask me to create a new branch, branch naming: task/NNN-short-description off master (e.g. task/002-persistance-implementation).

## Data
(Does not apply at this moment)

## How you must work
- Do only what is explicitly asked. **Do not add features or functionality on your own.**
- When you finish a task, review your changes.
- If you have questions or need clarification, ask the user before proceeding.
 - Ask a maximum of 6 questions at a time.
- Do not modify Models without asking me first.
- Follow SOLID and Clean Code principles.
- Prefer consistency with the existing codebase over introducing new patterns or abstractions.

## Code conventions
Before writing or modifying code, read and follow `CODE_CONVENTIONS.md`.

## Memory
- When you start, read 'MEMORY.md' to know the actual state of the project
- When you finish any task, update 'MEMORY.md'
- If there is anything that turns into a permanent rule, move it to AGENTS.md

## Limits
- ✅ Keep UI text in Spanish
- ✅ Read 'MEMORY.md' and keep it up to date
- ⚠️ Ask for: Creating new files, changing models
- 🚫 **Never** save sensitive data, even in 'MEMORY.md'


## Verification
(Does not apply at this moment)