# Code Conventions

## General

* Prefer simple, readable, and maintainable code.
* Keep types and methods focused on a single responsibility.
* Avoid unnecessary abstractions, patterns, or indirection; do not introduce an abstraction unless it provides a clear benefit.
* Prefer consistency with the existing codebase over introducing new conventions.
* Make the smallest change necessary; do not add functionality that was not requested.

## Swift

* Declare all properties (stored and computed) before initializers. Exception: in SwiftUI Views, `body` goes after the initializers.
* Do not add proxy state: expose the underlying value read-only instead of a wrapper that only forwards it (e.g. `lessons.isEmpty`, not a custom `isEmpty`).
* Model mutually exclusive states with a single enum (e.g. creation/editing) instead of separate optionals or derived booleans.
* Use `self.` whenever possible in classes; in structs, only inside initializers.
* Prefer `let` over `var`; use `guard` for early exits and validation.
* Use access control to expose only what is necessary.
* Prefer value types when reference semantics are not required.
* Use descriptive names rather than comments to explain intent.
* Avoid force unwrapping unless the value is guaranteed to exist.

## SwiftUI

* Keep Views focused on presentation and user interaction.
* Keep business and presentation logic in ViewModels, not in `body`.
* Prefer small, composable Views over large Views.
* Do not make Views responsible for creating their dependencies.

## Architecture

* Keep layers decoupled; Views must not depend directly on persistence frameworks.
* ViewModels should depend on abstractions rather than concrete implementations when appropriate.
* Inject dependencies through initializers and create concrete dependencies in the composition root.
* Keep domain models independent from persistence and UI frameworks.

## ViewModels

* Use `@Observable` for ViewModels when appropriate.
* Expose ViewModel state to Views as read-only with `private(set)`; only the ViewModel mutates it.
* ViewModels should not depend on UI-specific types when they can receive simpler values instead.
* ViewModels coordinate user actions with domain/repository operations; do not construct them inside Views when the composition root can provide them.

## Code Quality

* Favor clarity over cleverness.
* Before finishing a task, review the code for unnecessary complexity, duplication, and unrelated changes.
