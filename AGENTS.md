# AGENTS.md — first_learn

## Quick commands

```bash
flutter analyze
flutter run -d chrome
flutter pub get
flutter test                   # stale — widget_test checks for nonexistent counter
```

## Architecture

Single-package Flutter app. Root widget tree:

```
main.dart → MyApp (MaterialApp)
  └── MainScreen (Stateful, bottom nav)
        ├── tab 0: Homescreen     (AppBar + feed)
        ├── tab 1: placeholder    (Text "Search")
        ├── tab 2: Article        (AppBar + carousel + sections)
        └── tab 3: placeholder    (Text "Profile")
```

### File map

```
lib/
├── main.dart
├── view/
│   ├── main_screen.dart        ← bottom nav + page switching (Stateful)
│   ├── homescreen.dart         ← feed: stories row + Posts (Stateless)
│   └── article_screen.dart     ← carousel + sections (Stateless)
└── components/
    ├── post.dart               ← Instagram post card (Stateful — like/bookmark toggle)
    ├── story.dart              ← Instagram story circle (Stateless)
    ├── hover_button.dart       ← reusable hover/tap wrapper (Stateful)
    ├── trending_now.dart       ← image carousel + timer + dots (Stateful)
    └── today_news.dart         ← section header row + chip (Stateless)
```

### State vs Stateless

| Stateful | Why | Stateless | Why |
|---|---|---|---|
| MainScreen | `currentIndex` | MyApp | Never changes |
| Posts | `isLiked`, `isBookmarked` | Homescreen, Article | Props only |
| HoverButton | `isHovered` | Story, TodayNews | Props only |
| TrendingNow | Timer, `activeDot` | | |

### Assets

```
assets/images/
├── hustle_shirt.png
├── hustle.png
└── image.png
```

Only `assets/images/` declared in pubspec. `assets/icons/` not bundled.

## Patterns used

- **Pages = Scaffold with AppBar** (Homescreen, Article). **Widgets = no AppBar** (all components).
- **`Spacer()`** pushes items to opposite edges in a `Row`.
- **`SizedBox`** for fixed gaps between items.
- **`widget.xxx`** to access props inside `State` class.
- **`setState()`** to toggle bools in StatefulWidgets.
- **`AnimatedContainer`** for width/color transitions on dots.
- **`PageView` + `Timer`** for auto-sliding carousels.
- **`MainAxisSize.min`** on Column inside Align — required to position text.
- **`$` must be escaped** in Dart strings: `"\$20"`.

## Gotchas

- **Package name**: `first_learn` (underscore). Import paths: `package:first_learn/...`.
- **SDK**: `^3.12.1` — use Dart/Flutter features available in that version.
- **Linter**: `flutter_lints/flutter.yaml`. No custom rules.
- **hover_button**: `MouseRegion` only works on web/desktop. Mobile silently ignores it.
- **Empty Container is invisible** (0×0). Set `color`, `width`, or `child`.
- **`Container` can't have both `color` and `decoration`**. Put color inside BoxDecoration.
- **`boxShadow` expects a list** `[...]`, not a single value.
- **`BorderRadius.all()` needs `Radius.circular(20)`, not a raw `20`.**
