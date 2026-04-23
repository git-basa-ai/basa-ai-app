---
name: frontend-design
description: Create child-friendly, kid-safe, and playful UI designs optimized for mobile-first use by young learners (ages 5–12). Use this skill whenever the user asks for: educational apps for kids, reading/learning apps for children, phonics or literacy interfaces, playful dashboards for schools, kid-safe login screens, gamified progress trackers, teacher-student portals for elementary learners, or any interface targeting children. Also trigger for requests mentioning "kid UI", "child-safe design", "playful interface", "mobile learning app", "classroom app", or "elementary school app". Defaults to a blue-based color palette with friendly rounded aesthetics and large-touch mobile-first layouts.
---

# Child-Friendly UI Design Skill

A skill for crafting safe, engaging, and accessible interfaces for young learners (ages 5–12). Grounded in real-world educational app research, this skill produces mobile-first designs that are intuitive for children, reassuring for parents, and practical for teachers.

---

## Design Philosophy

Children are not small adults. Every design decision must serve their cognitive stage, motor ability, and emotional engagement. Before writing a line of code, commit to this mindset:

- **Safety over cleverness** — No dark patterns, no overwhelming choices, no hidden navigation
- **Delight over minimalism** — Children respond to joy; flat, corporate aesthetics disengage them
- **Touch-first, always** — Assume a small tablet or mobile phone; no hover-only interactions
- **Progressive success** — Every interaction should feel rewarding and achievable
- **Teacher & parent trust** — Secondary users (adults) must feel confident and in control

---

## Core Design System

### Color Palette (Blue-Based Default)

Use CSS variables for strict consistency. The following palette is the recommended default:

```css
:root {
  /* Primary Blues */
  --blue-sky: #4fc3f7; /* Light sky blue — main backgrounds, cards */
  --blue-ocean: #1565c0; /* Deep ocean blue — primary buttons, headers */
  --blue-bright: #2196f3; /* Bright blue — active states, highlights */
  --blue-soft: #bbdefb; /* Pale blue — disabled states, subtle fills */
  --blue-midnight: #0d47a1; /* Midnight — text on light backgrounds */

  /* Accent Colors (sparingly — 1 or 2 per screen) */
  --accent-sun: #ffd54f; /* Warm yellow — rewards, stars, highlights */
  --accent-grass: #66bb6a; /* Fresh green — correct answers, progress */
  --accent-coral: #ff7043; /* Coral orange — alerts, retry prompts */
  --accent-violet: #ce93d8; /* Soft purple — special items, bonus content */

  /* Neutrals */
  --white-cloud: #f8fbff; /* Near-white background */
  --gray-mist: #e3f2fd; /* Section dividers, card backgrounds */
  --text-dark: #1a237e; /* Deep navy for body text */
  --text-soft: #546e7a; /* Subdued text for labels */

  /* Semantic */
  --success: #43a047;
  --warning: #fb8c00;
  --error: #e53935;
  --info: #039be5;
}
```

**Rule**: Blue-sky and white-cloud are the dominant tones (~60%). Blue-ocean and bright-blue are structural (~30%). Accent colors are rewards and feedback only (~10%).

---

### Typography

Children need large, round, highly legible fonts. Avoid decorative serifs and thin weights.

**Recommended pairings:**

- **Display / Headings**: `Nunito` (rounded, friendly, excellent legibility)
- **Body / Instructions**: `Baloo 2` or `Quicksand` (warm, open letterforms)
- **Monospace / Numbers**: `Fredoka One` (chunky, easy to distinguish digits)

**Size scale (mobile-first, minimum touch):**

```css
--text-xs: 14px; /* Labels, captions */
--text-sm: 16px; /* Secondary text */
--text-base: 20px; /* Body, instructions */
--text-lg: 24px; /* Card titles, prompts */
--text-xl: 32px; /* Screen headings */
--text-2xl: 42px; /* Hero titles, celebrations */

/* Line height: always 1.5–1.7 for readability */
/* Font weight: 600–800 for headings, 500 for body */
```

---

### Spacing & Layout (Mobile-First)

Design at **375px wide** (iPhone SE baseline). Scale up with media queries — never down.

```css
/* Base grid */
--space-xs: 8px;
--space-sm: 12px;
--space-md: 16px;
--space-lg: 24px;
--space-xl: 32px;
--space-2xl: 48px;

/* Touch targets — MINIMUM 48×48px for all interactive elements */
--touch-min: 48px;
--touch-lg: 64px; /* Preferred for primary actions */
--touch-xl: 80px; /* Hero buttons, answer tiles */

/* Radius — always generous for child UIs */
--radius-sm: 12px;
--radius-md: 20px;
--radius-lg: 32px;
--radius-full: 9999px; /* Pills, badges, avatars */
```

**Layout rules:**

- Single-column layout on mobile; max 2 columns on tablet
- Bottom navigation bar (thumb-reachable) for 3–5 main sections
- Sticky header with character mascot and progress indicator
- Never stack more than 3 interactive elements vertically without a visual break
- Full-bleed hero cards with large imagery on top, text below

---

### Iconography & Imagery

- Use **filled icons** only (not outline) — easier for children to parse
- Minimum icon size: **28px** displayed, **48px** touch target
- Pair every icon with a text label (never icon-only navigation for children)
- Use illustrated characters or emoji-style icons over abstract symbols
- Character mascots (animals, friendly robots, stars) dramatically improve engagement

---

## Component Patterns

### 1. Activity Card

Large, tappable card for lessons, games, or story activities.

```
┌─────────────────────────────┐
│  🌟  [Illustrated Preview]  │  ← Full-width illustration (56% of card height)
│                             │
│  Lesson Title               │  ← text-lg, text-dark, font-weight 700
│  Short fun description      │  ← text-sm, text-soft
│  ━━━━━━━━━━━━━░░░░  60%     │  ← Progress bar (accent-grass fill)
│  [  START  ]                │  ← Full-width, touch-xl, blue-ocean bg
└─────────────────────────────┘
```

- Corner radius: `--radius-lg`
- Shadow: `0 6px 20px rgba(21, 101, 192, 0.15)`
- Hover/active: scale(0.97) with spring animation

### 2. Answer Tile (Quiz/Phonics)

Used for multiple-choice, phoneme selection, word matching.

```
┌────────────┐  ┌────────────┐
│     🐱     │  │     🐶     │
│    "cat"   │  │    "dog"   │
└────────────┘  └────────────┘
```

- 2-column grid on mobile, 3-column on tablet
- Minimum height: `--touch-xl` (80px)
- Correct state: `--accent-grass` border + ✅ badge + bounce animation
- Wrong state: `--error` border + ❌ + gentle shake animation
- Never remove wrong answers immediately — give 800ms feedback before transition

### 3. Progress / XP Bar

```
Level 3 🌟   ━━━━━━━━━░░░░  72%  → Level 4
```

- Always visible in the top header
- Animate fill with `transition: width 600ms ease-out`
- Celebrate milestones with confetti burst (CSS only preferred)

### 4. Mascot Feedback Bubble

Contextual speech bubble from a character mascot.

```
  [🐻 Mascot]
       💬 "Great job! Try again!"
```

- Position: bottom-left or bottom-right floating
- Animate entrance: slide-up + fade (300ms)
- Use for instructions, encouragement, error guidance — never error-only

### 5. Teacher Dashboard Panel

Calm, professional layout within the same color system.

- Reduce illustration density; increase data table usage
- Switch to `--blue-midnight` and `--gray-mist` as primary tones
- Keep fonts consistent but reduce to `--text-base` and `--text-sm`
- Clearly distinguish "teacher view" with a persistent role badge

---

## Motion & Animation

Child UIs require more motion than adult UIs — but motion must feel **safe and controllable**.

```css
/* Spring-like entrance for cards */
@keyframes popIn {
  0% {
    transform: scale(0.85);
    opacity: 0;
  }
  70% {
    transform: scale(1.04);
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

/* Celebration burst for correct answers */
@keyframes celebrate {
  0% {
    transform: scale(1) rotate(0deg);
  }
  30% {
    transform: scale(1.3) rotate(-5deg);
  }
  60% {
    transform: scale(1.1) rotate(3deg);
  }
  100% {
    transform: scale(1) rotate(0deg);
  }
}

/* Error shake */
@keyframes shakeMild {
  0%,
  100% {
    transform: translateX(0);
  }
  20% {
    transform: translateX(-6px);
  }
  40% {
    transform: translateX(6px);
  }
  60% {
    transform: translateX(-4px);
  }
  80% {
    transform: translateX(4px);
  }
}
```

**Rules:**

- All durations: 200–600ms; never exceed 800ms for feedback
- Always use `prefers-reduced-motion` media query to disable animations
- Stagger list item entrances: `animation-delay: calc(0.08s * var(--i))`
- Avoid looping animations on critical content (they distract from the task)

---

## Mobile-First Implementation Checklist

Before finalizing any child UI, verify:

- [ ] All touch targets ≥ 48×48px (use browser dev tools to confirm)
- [ ] Font size ≥ 16px everywhere; primary actions ≥ 20px
- [ ] Color contrast ≥ 4.5:1 for all text (WCAG AA minimum)
- [ ] No text conveys meaning by color alone (use icon + color)
- [ ] Navigation is reachable with one thumb (bottom-anchored)
- [ ] Loading states are friendly (animated mascot or spinner, never blank screens)
- [ ] Error messages use encouraging language ("Try again! You can do it 💪")
- [ ] Offline states are handled gracefully with clear explanation for teachers
- [ ] All images have descriptive `alt` text for screen readers
- [ ] `prefers-reduced-motion` is respected

---

## Kid-Safe Interface Rules

These are non-negotiable for any interface targeting children:

1. **No external links** without a parent/teacher gate screen
2. **No user-generated content visible** to other children without moderation
3. **No countdown timers that punish** — timers may encourage but never lock out
4. **No dark patterns** — no fake urgency, no confusing close buttons on ads
5. **Profile avatars only** — no real photos of children in shared views
6. **Session timeouts** should warn before ending with a "save progress" prompt
7. **Leaderboards** should show encouragement for all positions, not just top ranks
8. **Teacher/admin controls** must be visually separated from the learner experience

---

## Adaptive Difficulty UI Signals

When the app adjusts difficulty (e.g., phonics levels), the UI should communicate this non-verbally:

- **Easier level**: Warmer colors, larger text, more spacing, mascot appears more often
- **Harder level**: Slightly cooler palette shift, denser layout, timer may appear
- **Achievement unlock**: Full-screen celebration overlay (3s max), then return to activity

---

## Sample Screen Structures

### Learner Home Screen (Mobile)

```
┌──────────────────────────┐
│ 👋 Hi, Maria!   🌟 Lv 3 │  ← Header (blue-ocean bg, white text)
│ ━━━━━━━━━░░░░  72% → Lv4│  ← XP bar
├──────────────────────────┤
│  📖 Today's Lesson       │  ← Section label (text-soft)
│  ┌────────────────────┐  │
│  │ 🖼️ [Illustration]  │  │  ← Activity Card (primary)
│  │ "Sounds of the B"  │  │
│  │ ████░░░░  40%      │  │
│  │   [ START NOW ]    │  │
│  └────────────────────┘  │
│  ┌──────┐  ┌──────┐      │  ← Secondary cards (2-col)
│  │ 🎮   │  │ 📚   │      │
│  │Games │  │Words │      │
│  └──────┘  └──────┘      │
├──────────────────────────┤
│  🏠    📖    🎮    👤    │  ← Bottom nav (blue-bright icons)
└──────────────────────────┘
```

### Teacher Dashboard (Mobile)

```
┌──────────────────────────┐
│ 📊 Class Overview  👩‍🏫  │  ← Header (blue-midnight bg)
│ Grade 1 – Section A      │
├──────────────────────────┤
│ ┌────────────────────┐   │
│ │ 28 Learners        │   │  ← Summary card
│ │ 🟢 18 On Track     │   │
│ │ 🟡  7 Needs Help   │   │
│ │ 🔴  3 Non-readers  │   │
│ └────────────────────┘   │
│ [View Full Report ›]      │
│                          │
│ Recent Activity           │
│ • Maria – completed B    │
│ • Juan  – needs help CVC │
└──────────────────────────┘
```

---

## Integration with Educational Features

When building apps like reading/phonics tools (e.g., inspired by Basa Santa Rosa):

- **Speech feedback UI**: Show animated mouth/lips graphic alongside audio waveform; use `--accent-grass` for correct pronunciation, `--error` for retry
- **QR code scanning**: Full-screen camera view with a friendly border guide (rounded corners, blue-bright)
- **Offline mode indicator**: Persistent top banner in `--accent-sun` yellow — "You're offline. Progress saved locally 💾"
- **Progress sync animation**: Cloud icon with animated upward arrows when syncing with backend (Firebase, etc.)
- **Picture dictionary**: Grid of large illustrated word cards — 2 columns mobile, 3 columns tablet; tap to hear pronunciation

---

## Quick Reference: Do's and Don'ts

| ✅ Do                            | ❌ Don't                                     |
| -------------------------------- | -------------------------------------------- |
| Use rounded corners everywhere   | Use sharp 90° corners                        |
| Large, colorful CTA buttons      | Small or text-only links for primary actions |
| Friendly encouraging copy        | Negative error messages ("Wrong!")           |
| Illustrations and mascots        | Stock photos of real children                |
| Bottom navigation bar            | Hamburger menu hidden in corner              |
| Celebrate every small win        | Only celebrate final completion              |
| Test on real 375px devices       | Design desktop-first and scale down          |
| Blue-dominant, warm accents      | Random rainbow color explosion               |
| Gradual difficulty transitions   | Sudden jumps in complexity                   |
| `prefers-reduced-motion` support | Assuming all children can handle fast motion |
