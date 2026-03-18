# Design Spec: [Feature Name]

**Goal ID:** [B-id] → [F-id]
**Status:** Draft
**Author:** uiux-designer
**Created:** [ISO-date]
**Last Updated:** [ISO-date]
**PRD Reference:** .agency/projects/[slug]/prd.md

---

## Design Principles (for this feature)

> *2–4 principles that guide every design decision in this spec.*

1. **[Principle]:** [one sentence description]
2. **[Principle]:** [one sentence description]
3. **[Principle]:** [one sentence description]

---

## Design System

> *All design tokens used in this feature. If extending an existing system, note only the additions/overrides.*

### Colour Palette

| Token | Hex | Tailwind Class | Usage |
|-------|-----|----------------|-------|
| Primary | `#3B82F6` | `blue-500` | CTAs, links, active states |
| Primary Dark | `#1D4ED8` | `blue-700` | Hover states |
| Primary Light | `#EFF6FF` | `blue-50` | Backgrounds, chips |
| Secondary | `#6366F1` | `indigo-500` | Secondary actions |
| Success | `#10B981` | `emerald-500` | Success states |
| Warning | `#F59E0B` | `amber-500` | Warning states |
| Error | `#EF4444` | `red-500` | Error states, destructive |
| Neutral 900 | `#111827` | `gray-900` | Primary text |
| Neutral 600 | `#4B5563` | `gray-600` | Secondary text |
| Neutral 300 | `#D1D5DB` | `gray-300` | Borders |
| Neutral 50 | `#F9FAFB` | `gray-50` | Page backgrounds |

### Typography

| Level | Size | Weight | Line Height | Tailwind |
|-------|------|--------|-------------|---------|
| H1 | 30px | 700 | 1.2 | `text-3xl font-bold` |
| H2 | 24px | 600 | 1.3 | `text-2xl font-semibold` |
| H3 | 20px | 600 | 1.4 | `text-xl font-semibold` |
| Body | 16px | 400 | 1.5 | `text-base` |
| Small | 14px | 400 | 1.5 | `text-sm` |
| Caption | 12px | 400 | 1.4 | `text-xs` |
| Font Family | Inter, system-ui, sans-serif | | | `font-sans` |

### Spacing Scale

Base unit: 4px (1 = 4px in Tailwind)

Common values: `4` (1rem) / `8` (2rem) / `12` (3rem) / `16` (4rem) / `24` (6rem) / `32` (8rem) / `48` (12rem)

### Border Radius

| Token | Value | Tailwind |
|-------|-------|---------|
| Small | 4px | `rounded` |
| Medium | 6px | `rounded-md` |
| Large | 8px | `rounded-lg` |
| Full | 9999px | `rounded-full` |

### Shadows

| Level | Tailwind | Usage |
|-------|---------|-------|
| Subtle | `shadow-sm` | Cards, inputs |
| Standard | `shadow` | Dropdowns, popovers |
| Elevated | `shadow-lg` | Modals, dialogs |

---

## Screen Inventory

> *Complete list of screens and modal/overlay states in this feature.*

| ID | Screen Name | Route/Trigger | User Story Ref |
|----|-------------|---------------|----------------|
| S-01 | [Screen Name] | `/route` | US-001 |
| S-02 | [Screen Name] | [trigger] | US-002 |
| S-03 | [Modal/Overlay Name] | [trigger] | US-001 |

---

## Wireframes

> *ASCII wireframe for every screen. Include all states: default, loading, empty, error, success.*

---

### S-01: [Screen Name]

**Route:** `/[route]`
**User Story:** US-001
**Purpose:** [one sentence]

#### Default State

```
┌─────────────────────────────────────────────────────────┐
│  ┌─────────────────────────────────────────────────┐    │
│  │  NAVIGATION BAR                                  │    │
│  │  [Logo]    [Nav 1]  [Nav 2]  [Nav 3]  [Avatar]  │    │
│  └─────────────────────────────────────────────────┘    │
│                                                          │
│  ┌───────────────────────────────────────────────────┐  │
│  │  PAGE HEADER                                       │  │
│  │  Page Title (H1)                [Primary Action]  │  │
│  │  Subtitle / breadcrumb                            │  │
│  └───────────────────────────────────────────────────┘  │
│                                                          │
│  ┌──────────────────┐  ┌───────────────────────────┐   │
│  │  SIDEBAR (if any)│  │  MAIN CONTENT             │   │
│  │                  │  │                            │   │
│  │  [Nav item 1]    │  │  ┌────────┐ ┌────────┐   │   │
│  │  [Nav item 2] ●  │  │  │ Card 1 │ │ Card 2 │   │   │
│  │  [Nav item 3]    │  │  └────────┘ └────────┘   │   │
│  │                  │  │                            │   │
│  └──────────────────┘  └───────────────────────────┘   │
│                                                          │
└─────────────────────────────────────────────────────────┘

Dimensions: 1440px desktop / 768px tablet / 375px mobile
```

#### Empty State

```
┌──────────────────────────────────────────────┐
│                                              │
│            [Empty state icon]                │
│                                              │
│         No [items] yet                       │
│    Create your first [item] to get started   │
│                                              │
│         [Primary CTA Button]                 │
│                                              │
└──────────────────────────────────────────────┘
```

#### Loading State

```
┌──────────────────────────────────────────────┐
│  ┌────────────────────────────────────────┐  │
│  │  ████████████████░░░░░░  (skeleton)    │  │
│  └────────────────────────────────────────┘  │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐   │
│  │ ████████ │  │ ████████ │  │ ████████ │   │
│  │ ████████ │  │ ████████ │  │ ████████ │   │
│  └──────────┘  └──────────┘  └──────────┘   │
└──────────────────────────────────────────────┘
```

---

*(Add more screens as needed — one section per screen/state)*

---

## Component Specs

> *Full CSS/Tailwind specification for every custom component.*

---

### Component: [ComponentName]

**Purpose:** [one sentence]
**Used on screens:** S-01, S-02
**States:** default | hover | focus | active | disabled | loading | error | success

#### HTML Structure with Tailwind Classes

```html
<!-- [ComponentName] — Default State -->
<div class="flex flex-col gap-2">
  <label class="text-sm font-medium text-gray-700">
    [Label Text]
  </label>
  <div class="relative">
    <input
      type="text"
      class="w-full px-3 py-2 text-base text-gray-900 bg-white border border-gray-300 rounded-md shadow-sm placeholder:text-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-colors duration-150"
      placeholder="[Placeholder text]"
    />
  </div>
  <!-- Error state — shown when invalid -->
  <p class="hidden text-xs text-red-600" role="alert">
    [Error message]
  </p>
</div>
```

#### State Variations

| State | Class Change | Notes |
|-------|-------------|-------|
| Hover | `hover:border-gray-400` | Border darkens |
| Focus | `focus:ring-2 focus:ring-blue-500 focus:border-transparent` | Blue ring |
| Error | Replace `border-gray-300` with `border-red-500`; show error `<p>` | |
| Disabled | Add `disabled:bg-gray-50 disabled:text-gray-400 disabled:cursor-not-allowed` | |

#### Interaction Notes

- Tab order: [describe keyboard navigation]
- Enter key: [what happens]
- Animation: [transition details, e.g., 150ms ease-in-out]

#### Accessibility

- Role: `[ARIA role if needed]`
- Label: Always paired with `<label>` or `aria-label`
- Error: `aria-describedby` links input to error message `id`
- Contrast: `text-gray-900` on `white` = 16:1 (passes AAA)

---

*(Add more components as needed)*

---

## User Flow Diagrams

> *ASCII flow for each primary user journey.*

### Flow: [Flow Name]

**Story ref:** US-001

```
[Entry point: /login]
        │
        ▼
[Screen S-01: Login form]
  User enters credentials
        │
   ┌────┴────────┐
   │             │
[Valid]      [Invalid — 3 attempts]
   │             │
   ▼             ▼
[S-02:        [Lock account modal]
 Dashboard]    └→ [Email reset link]
```

---

## Responsive Behaviour

| Screen | Breakpoint | Key Changes |
|--------|-----------|-------------|
| Mobile | < 768px | Single column, sidebar hidden (hamburger menu) |
| Tablet | 768–1024px | Two columns, condensed nav |
| Desktop | > 1024px | Full layout as wireframed |

---

## Accessibility Notes

| Area | Requirement | Implementation |
|------|-------------|----------------|
| Colour contrast | AA minimum | All text passes — see tokens above |
| Keyboard navigation | Full keyboard access | Tab order follows visual flow |
| Screen readers | ARIA labels | All interactive elements labelled |
| Focus indicators | Visible on all interactive elements | `focus:ring-2` on all inputs/buttons |
| Images | Alt text | Decorative images: `alt=""` |

---

## Open Design Questions

| # | Question | Impact | Status |
|---|----------|--------|--------|
| 1 | [Question] | [what it affects] | Open |

---

## Approval Status

| Reviewer | Role | Decision | Date | Notes |
|----------|------|----------|------|-------|
| PM | product-manager | Pending | — | — |
| User | Stakeholder | Pending | — | — |

**Current status:** DRAFT — Pending governance gate approval
