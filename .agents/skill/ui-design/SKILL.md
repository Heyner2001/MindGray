---
name: gris-inspired-ui
description: Design calm, artistic, atmospheric interfaces inspired by the visual language and main menu composition of GRIS. Use for MindGray and other SwiftUI screens that should feel painterly, contemplative, organic, minimal, and accessible rather than like a conventional content catalog or audiobook app.
---

# GRIS-Inspired UI Design Skill

## Purpose

Create an original interface inspired by the broad visual language of *GRIS*: delicate circular geometry, fine lines, watercolor-like atmosphere, restrained color, expressive negative space, elegant typography, and slow, organic motion.

The target feeling is **entering a small, contemplative world**, not browsing a commercial catalog. Use GRIS as artistic inspiration, not as a template to copy. Do not reproduce its exact menu, logo, characters, illustrations, or distinctive artwork.

For MindIn, preserve the product's core purpose: creating profiles of people or characters and exploring their philosophy and the user's reflections. Do not invent new product features to justify the visual style.

## Visual Direction

1. **Compose like an illustrated scene.** Establish a central focal point and arrange secondary elements around it with care. Favor balanced, sometimes gently asymmetrical compositions over standard stacks of identical cards.
2. **Use circles and fine geometry.** Explore concentric rings, thin circular outlines, arcs, small points, and subtle radial arrangements inspired by the menu's geometry. These elements should frame content, not obstruct it.
3. **Let the background create atmosphere.** Use original watercolor-like landscapes, pigment washes, soft paper grain, silhouettes, and organic shapes where appropriate. Keep important text on quiet, readable areas.
4. **Make negative space intentional.** Let the composition breathe. Do not fill every area with controls, labels, cards, or decorative details.
5. **Keep the UI visually integrated.** Text and controls should feel placed within the scene rather than placed inside a stack of generic panels.
6. **Use restraint.** Each screen should have one main visual idea, one dominant color family, and only a few supporting elements.
7. **Preserve usability.** Artistic composition must never hide navigation, actions, status, or content hierarchy.

## Color Tokens

These are suggested starting values inspired by the game's atmosphere, not official colors sampled from GRIS.

These tokens describe the **light appearance only**. The product ships light-only for now: do not define dark variants and do not adapt the palette to the system's dark appearance. Revisit this decision when dark mode enters scope.

| Token | Hex | Intended use |
|---|---|---|
| `color.canvas` | `#E8E1D8` | Warm, paper-like background |
| `color.coolAccent` | `#B9C8D4` | Muted blue-gray atmosphere |
| `color.warmAccent` | `#C97873` | Restrained dusty-rose emphasis |
| `color.naturalAccent` | `#9DAF96` | Muted sage accent |
| `color.textPrimary` | `#4A4749` | Main text and important icons |
| `color.textSecondary` | `#777276` | Supporting text, only when contrast is sufficient |

### Color Rules

- Use one dominant color family per screen or section; do not use all accent colors equally.
- Let color express the mood of a screen or profile, but keep functional states recognizable.
- Prefer softened neutrals over pure white and pure black when appropriate.
- Watercolor effects should be subtle and organic, not glossy gradients or neon glows.
- Meet accessible contrast requirements. Adjust tokens when needed; never preserve a color at the expense of legibility.
- Treat these tokens as a starting palette, not a fixed limitation or official GRIS palette.
- Target the light appearance only. Every surface, text color, and control must stay readable on the light canvas whatever the system appearance is set to.

## Typography

- Use **Cormorant Garamond** for expressive titles, profile names, and occasional philosophical quotations.
- Use **SF Pro** for body copy, controls, form fields, navigation, and other functional text.
- Prefer Cormorant Garamond Regular (400) or Medium (500) for titles; use heavier weights sparingly.
- Use SF Pro Regular (400) for body text, Medium (500) for buttons, and Semibold (600) only when hierarchy requires it.
- Suggested mobile starting sizes: expressive title 30–40 pt, section title 22–30 pt, body 15–17 pt, supporting labels 12–14 pt. Adapt to Dynamic Type and actual content.
- Use generous line spacing for reflective text and comfortable line lengths.
- Do not use decorative serif typography for small labels, dense text, or controls where clarity matters.

## Layout, Spacing, and Composition

Suggested spacing scale:

| Token | Value | Use |
|---|---:|---|
| `space.xs` | 4 pt | Closely related details |
| `space.sm` | 8 pt | Compact internal spacing |
| `space.md` | 16 pt | Standard spacing |
| `space.lg` | 24 pt | Content-group separation and mobile side margins |
| `space.xl` | 32 pt | Section separation |
| `space.2xl` | 48 pt | Major visual breaks |
| `space.ambient` | 64+ pt | Breathing room around a focal point |

- Start with 20–24 pt horizontal margins on iPhone, adapting to available width and safe areas.
- Establish the composition before deciding where each control belongs.
- Use scale, alignment, spacing, contrast, and fine geometry to guide the eye.
- Leave deliberate open space around the title or main visual motif.
- Avoid absolute widths for entire screens; use adaptable layouts. On wider devices, constrain reading and form content rather than stretching it across the screen.
- Use asymmetry only when it improves the composition and does not make navigation unpredictable.
- Do not introduce empty space that forces unnecessary scrolling or makes primary actions hard to find.

## Shapes, Lines, and Surfaces

- Favor open compositions, fine strokes, delicate dividers, arcs, and circular framing.
- Use concentric circles or radial layouts selectively, especially for a home screen, title treatment, or selected-profile composition.
- Prefer subtle surface changes and watercolor texture over conventional card elevation.
- Avoid thick outlines, hard-edged panels, pronounced shadows, and uniform rounded cards.
- Use cards only when they materially improve grouping, interaction, or comprehension.
- Never place busy textures directly behind essential text unless a quiet overlay or separate text region preserves contrast.
- Keep interactive elements visually recognizable and easy to tap, even when their appearance is understated.

## Imagery and Illustration

- Prefer original atmospheric illustrations with organic silhouettes, broad color washes, restrained detail, and a clear focal point.
- Use background art to create a sense of place, not as a substitute for information architecture.
- Keep image treatments consistent across the app, while allowing individual profiles to have their own mood where the product content supports it.
- Do not use generic stock imagery just to fill space.
- Do not copy GRIS screenshots, exact circular arrangements, artwork, characters, or proprietary assets. Create original compositions that use similar high-level principles.

## Motion and Transitions

Suggested starting durations; adjust to the interaction and platform conventions.

| Token | Duration | Typical use |
|---|---:|---|
| `motion.quick` | 150–220 ms | Small state changes |
| `motion.standard` | 250–350 ms | Content appearance or disappearance |
| `motion.transition` | 350–500 ms | Screen or section transitions |
| `motion.expressive` | 500–800 ms | Deliberate illustration or scene entrance |

- Favor gentle ease-in/ease-out, opacity, and short spatial shifts.
- Motion may suggest drifting, unfolding, or settling, but must remain restrained.
- Keep common actions responsive; never delay interaction for decoration.
- Respect Reduce Motion and provide equivalent functional feedback.
- Never use animation as the only signal for an important state.

## Component Guidance

- **Primary actions:** Use clear labels and quiet styling. A fine outline, understated fill, or text action may fit better than a large pill button. Maintain a suitable tap target.
- **Navigation:** Keep it predictable and discoverable. Do not hide essential navigation inside decorative geometry.
- **Profile browsing:** Prefer typographic hierarchy, open space, subtle circular framing, and a clear selected state over a wall of cards. Choose list, grid, or radial composition based on usability, not novelty.
- **Profile detail:** Let the profile name, philosophy, and reflections feel like parts of a coherent editorial scene. Keep reflection text readable and comfortable to scan.
- **Forms:** Use quiet surfaces and minimal borders, but preserve visible labels, focus states, validation, and error messages.
- **Empty states:** Use a concise invitation, generous breathing room, and a small original illustration or restrained circular motif. Make the creation action obvious.
- **Feedback and errors:** Communicate outcomes clearly. Do not rely on subtle color changes, texture, or animation alone.

## iOS and SwiftUI Guidance

- Respect safe areas, navigation behavior, accessibility, Dynamic Type, and platform conventions.
- Use SF Pro through the system font and register bundled Cormorant Garamond files correctly when using custom fonts.
- Build reusable semantic color, typography, spacing, stroke, and motion tokens instead of scattering literal values.
- Prefer adaptable layout with available width and appropriate maximum widths; avoid fixing the whole interface to one device size.
- Keep view composition modular and implementation proportional to the design's complexity.
- Ensure controls have appropriate hit targets and accessibility labels even if their visible treatment is delicate.
- Test larger text sizes, contrast, the light appearance, and Reduce Motion.
- Do not add architecture or abstractions solely for visual styling.

## Decision Rules

When designing or reviewing a screen:

1. Identify the user's primary task and the content that must remain immediately understandable.
2. Define a single focal point and an atmospheric composition before adding components.
3. Decide whether fine circles, arcs, line work, or watercolor imagery support this particular screen; do not add them automatically.
4. Choose one dominant color family and a small number of semantic accents.
5. Use Cormorant Garamond for expressive moments and SF Pro for functional clarity.
6. Prefer spacing, alignment, and typography over containers and shadows.
7. Check discoverability, accessibility, responsiveness, and platform conventions.
8. Remove any element that adds noise without improving identity, comprehension, or usability.

If the interface begins to resemble an audiobook app, a media catalog, or a generic card-based dashboard, revisit the composition: reduce repeated cards, give the background and negative space more presence, introduce subtle geometric framing, and strengthen the editorial quality of the typography.

## Avoid

- Copying GRIS's exact menu, artwork, characters, or proprietary assets.
- Repeated cards and cover grids as the default visual language.
- Heavy shadows, glassmorphism, glossy effects, excessive gradients, or neon accents.
- Too many saturated colors competing on one screen.
- Dense layouts without breathing room.
- Decorative texture that reduces contrast.
- Tiny text, low contrast, or hidden controls.
- Animations that delay common tasks or ignore Reduce Motion.
- Treating the suggested colors and durations as official GRIS specifications.

## Quality Checklist

Before delivering a design, verify:

- [ ] The screen feels like an original, contemplative illustrated world rather than an audiobook/catalog app.
- [ ] There is one clear visual focal point.
- [ ] Circular geometry, fine lines, watercolor, or atmospheric imagery are used purposefully, not as decoration everywhere.
- [ ] The palette is restrained and has a dominant color family.
- [ ] Typography balances expressive Cormorant Garamond with functional SF Pro.
- [ ] Spacing and negative space support the composition and the task.
- [ ] Repeated cards, heavy shadows, and unnecessary panels have been avoided.
- [ ] Motion is calm, brief, and respectful of Reduce Motion.
- [ ] Text contrast, Dynamic Type, and control accessibility are supported.
- [ ] The design holds up in the light appearance only, with no dark variants.
- [ ] The interface adapts to device sizes and follows iOS conventions.
- [ ] The result feels original and usable, not like a copy of GRIS.
