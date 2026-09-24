# Assignment 4 — Campus Pulse

A responsive multi-section Flutter dashboard for a student campus home screen. The layout changes with screen size using **ListView**, **GridView**, **MediaQuery**, and **Flexible / Expanded**.

## Assignment requirements

| Requirement | How it is used |
|---|---|
| **ListView** | Main page scroll. Also used for today’s timetable and announcements. Nested lists use `shrinkWrap` and `NeverScrollableScrollPhysics` so they sit inside the outer list. |
| **GridView** | Stats cards, quick actions, and courses. Column count changes with width. |
| **MediaQuery** | `MediaQuery.of(context).size.width` picks phone / tablet / desktop breakpoints and padding. |
| **Expanded** | Welcome text, stat labels, and the timetable column on wide screens (`flex: 3`). |
| **Flexible** | Shortcuts column on wide screens (`flex: 2`) so it can shrink beside the timetable. |

## Screen sizes

| Width | Layout |
|---|---|
| **&lt; 600 px** (phone) | 2 stat columns, 1 course column, stacked timetable then shortcuts |
| **600–1023 px** (tablet) | 4 stat columns, 2 course columns, stacked sections |
| **≥ 900 px** (wide) | Timetable and shortcuts sit in one row |
| **≥ 1024 px** (desktop) | 3 course columns |

Resize the Chrome window to see the dashboard reflow.

## Sections

1. **Welcome banner** — greeting and next-task summary  
2. **Today at a glance** — classes, due work, GPA, hours left  
3. **Today’s timetable** — schedule list  
4. **Quick actions** — submit lab, meetup, library, mail  
5. **Your courses** — progress cards  
6. **Announcements** — campus notices  

## Run the app

From this folder:

```bash
cd assignment4
flutter pub get
flutter run
```

Pick **Chrome** for desktop, or a phone / simulator for mobile.

Hot reload (`r`) is enough after most UI edits. Use hot restart (`R`) after changing `main()`.

## Project files

```
assignment4/
  lib/main.dart          # entire dashboard (single Dart file)
  test/widget_test.dart  # smoke test for the home screen
  pubspec.yaml
```

All UI lives in `lib/main.dart`. No extra packages are required beyond Flutter.

## Concepts to explain in class

- **Nested scrolling:** inner `GridView` / `ListView` must not fight the outer `ListView`, so they disable their own scroll.
- **Breakpoints:** one `width` from `MediaQuery` drives column counts and whether the bottom block is a `Row` or a `Column`.
- **Space sharing:** `Expanded` takes leftover space; `Flexible` can be smaller than its child if the row is tight.
