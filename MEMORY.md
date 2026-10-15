# MindGray - MEMORY
Project memory between sessions. Max ~50 lines: review or remove what isn't important.

## Current state:
- V2: local SwiftData persistence (repository protocol + factory), merged to master via PR #2
- task/005 (list/detail views) merged to master via PR #4
- Branch task/006-ui-redesign: GRIS-inspired UI redesign committed (fonts + design system/views + navigation fix) + scene-like composition (ring motif, hairlines, serif quotation). Not merged yet
- Custom font: Cormorant Garamond Regular + Medium in MindGray/Fonts; registered through MindGray/Info.plist (UIAppFonts); INFOPLIST_FILE set by Xcode
- Design skill governing the UI: .agents/skill/ui-design/SKILL.md (untracked; declares the app light-only)
- No tests, no linter, no CI

## Decisions:
- No third-party dependencies
- Style (CODE_CONVENTIONS.md): properties (stored+computed) before initializers, except View `body` (goes after init); use `self.` in classes, in structs only inside initializers; ViewModel state is `private(set)`, named after its data; mutually exclusive states use a single enum
- Design system in MindGray/DesignSystem: ColorTokens, TypographyTokens, SpacingTokens, StrokeTokens, MotionTokens + DynamicColor helper (Color(light:dark:), Color(hex:))
- Cormorant Garamond only for display headings and quotations (24 pt and up); SF for body text, labels and controls. No italic cut exists, so quotations never fake one
- Composition follows the skill's scene direction: fine geometry (concentric rings), hairline dividers and field underlines instead of rounded panels, generous negative space. No background wash
- The list draws its own header (system nav bar hidden with `.toolbar(.hidden, for: .navigationBar)`): serif "Reflexiones" plus the ring motif on the trailing edge, whose center holds the "Nueva reflexión" `+`, so the motif is decoration and button at once and the button has no chrome at all
- Layout is width-aware: list/form/detail are capped at `SpacingTokens.readingWidth` and centered, so iPad and landscape read as a column instead of stretching
- Tokens that lost their call sites (ColorTokens.surface, SpacingTokens.xl/ambient/cornerRadius/fieldCornerRadius, TypographyTokens.display/callout, MotionTokens) stay as design-system vocabulary
- Light appearance only for now: ColorTokens hold single light values, the accent color has no dark variant, and ContentView forces `.preferredColorScheme(.light)`. `Color(light:dark:)` stays unused as the documented way back to dark mode
- MotionTokens (reduce-motion aware helpers) currently has no call sites: the form↔list cross-fade was removed because it wrapped two full NavigationStacks
- Persistence layer could change
- LessonRepositoryFactory owns ModelContainer/ModelContext creation; fallback chain: normal → delete store & retry → in-memory (never crash). ContentView no longer touches SwiftData
- The form always dismisses on save: from the empty state the app lands on the list (`onSaved` → reload), from the list it pops back and the list refreshes on `onDisappear`. Do not gate `dismiss()` on the form mode
- UI copy is Spanish

## Lessons and mistakes to avoid
- Ask first: never run builds, simulator runs, temporary experiments or throwaway copies without explicit permission. Diagnose and propose; the user decides what to execute
- If a build is approved, do it in a temp copy (rsync) so DerivedData and xcuserdata never touch the repo, and delete the temp copy afterwards
- UIAppFonts still needs an Info.plist: Xcode's target Info tab creates and references that file; there is no INFOPLIST_KEY_ shortcut
- Never declare `.navigationDestination(for:)` on a `Group`/`if`-`else` branch: put it on an eager container around the `List`, or use `NavigationLink { destination } label: { … }` (this link needs no destination registry)
- To enlarge a `Button` tap target, the frame + `.contentShape` go inside the `label`: applied outside, the extra area stays untappable
- Hiding the nav bar on a root view also hides it on pushed views unless they ask for it back: `LessonDetailView` needs `.toolbar(.visible, for: .navigationBar)` or it loses its back button

## Next steps:
- Verify the redesign on the simulator (light appearance only, Dynamic Type, Reduce Motion) and open the PR for task/006-ui-redesign
- Possibly swap factory to RemoteLessonRepository in the future
