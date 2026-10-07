# Code Conventions

## General

* Prefer simple, readable, and maintainable code.
* Keep types and methods focused on a single responsibility.
* Avoid unnecessary abstractions, patterns, or indirection.
* Prefer consistency with the existing codebase over introducing new conventions.
* Make the smallest change necessary to solve the requested task.
* Do not add functionality that was not requested.

## Swift

* Prefer `let` over `var` whenever possible.
* Use `guard` for early exits and validation.
* Use access control to expose only what is necessary.
* Prefer value types when reference semantics are not required.
* Keep functions small and focused.
* Use descriptive names rather than comments to explain intent.
* Avoid force unwrapping unless the value is guaranteed to exist.

## SwiftUI

* Keep Views focused on presentation and user interaction.
* Keep business and presentation logic in ViewModels.
* Avoid putting business logic directly in `body`.
* Prefer small, composable Views over large Views.
* Do not make Views responsible for creating their dependencies.

## Architecture

* Keep layers decoupled.
* Views must not depend directly on persistence frameworks.
* ViewModels should depend on abstractions rather than concrete implementations when appropriate.
* Inject dependencies through initializers.
* Create concrete dependencies in the composition root.
* Keep domain models independent from persistence and UI frameworks.
* Do not introduce an abstraction unless it provides a clear benefit.

## ViewModels

* Use `@Observable` for ViewModels when appropriate.
* ViewModels should not depend on UI-specific types when they can receive simpler values instead.
* ViewModels are responsible for coordinating user actions with domain/repository operations.
* Do not construct ViewModels inside Views when they can be provided by the composition root.

## Code Quality

* Follow SOLID and Clean Code principles pragmatically.
* Favor clarity over cleverness.
* Before finishing a task, review the code for unnecessary complexity, duplication, and unrelated changes.
