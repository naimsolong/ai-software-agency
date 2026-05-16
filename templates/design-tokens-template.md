# Design Tokens: [Feature Name]

**Goal ID:** [B-id] → [P-id] → [F-id]
**Status:** Draft
**Author:** uiux-designer
**Created:** [ISO-date]
**Last Updated:** [ISO-date]
**Project Slug:** [project-slug]
**PRD Reference:** ~/.software-agency/projects/[project-slug]/prd.md

---

## Overview

> *What design system does this project use? List the primary design library, component framework, or custom system this token file maps to.*

**Design System:** [e.g. Material Design 3, Tailwind CSS, Custom]
**Component Library:** [e.g. shadcn/ui, MUI, Ant Design, Custom]
**Base Font Size:** [e.g. 16px (1rem = 16px)]

---

## Color Tokens

<!--
  Fill in all colors used in the design. Group by category.
  - Token Name: semantic name (e.g. "Primary", "Error/500")
  - Hex: the hex value
  - Light Mode Value: if different from hex (e.g. CSS variable override)
  - Dark Mode Value: the dark mode equivalent, or "—" if same
  - CSS Variable: the CSS custom property name (e.g. --color-primary)
  - Usage: where this token is applied (e.g. "Primary buttons, links")
-->

### Brand Colors

| Token Name | Hex | Light Mode | Dark Mode | CSS Variable | Usage |
|---|---|---|---|---|---|
| | | | | | |

### Neutral / Gray Scale

| Token Name | Hex | Light Mode | Dark Mode | CSS Variable | Usage |
|---|---|---|---|---|---|
| | | | | | |

### Semantic Colors

| Token Name | Hex | Light Mode | Dark Mode | CSS Variable | Usage |
|---|---|---|---|---|---|
| Error | | | | | |
| Warning | | | | | |
| Success | | | | | |
| Info | | | | | |

### On-Colors

<!-- Colors used for content placed ON TOP of brand/semantic colors (text, icons) -->

| Token Name | Hex | Light Mode | Dark Mode | CSS Variable | Usage |
|---|---|---|---|---|---|
| | | | | | |

---

## Typography Tokens

<!--
  Document every text style used in the design.
  - Token Name: semantic name (e.g. "heading/xl", "body/small")
  - Usage: where this style is applied (e.g. "Page titles", "Form labels")
-->

**Primary Font:** [Font Family Name]
**Fallback Font:** [Fallback stack]

| Token Name | Font Family | Weight | Size | Line Height | Letter Spacing | Usage |
|---|---|---|---|---|---|---|
| | | | | | | |

---

## Spacing Tokens

<!--
  Document the spacing scale. Prefer semantic names over raw values.
  - Token Name: semantic (e.g. "page-padding", "gap-section")
  - px: pixel value
  - rem: rem equivalent (based on base font size)
  - Tailwind Class: if using Tailwind, the corresponding utility class
  - Usage: where this spacing is applied
-->

| Token Name | px | rem | Tailwind Class | Usage |
|---|---|---|---|---|
| | | | | |

---

## Border & Radius Tokens

<!--
  Document border styles and border-radius values.
-->

### Borders

| Token Name | Value | Usage |
|---|---|---|
| | | |

### Border Radius

| Token Name | Value | Usage |
|---|---|---|
| | | |

---

## Shadow Tokens

<!--
  Document box-shadow values. Use semantic naming.
  - Token Name: semantic (e.g. "shadow/card", "shadow/elevated")
  - Value: CSS box-shadow value
  - Usage: where this shadow is applied
-->

| Token Name | Value | Usage |
|---|---|---|
| | | |

---

## Component Sizing Tokens

<!--
  Document fixed dimensions for reusable components.
  - Token Name: component-property (e.g. "button-height", "icon-sm")
  - min: minimum size (or "—")
  - default: standard size
  - max: maximum size (or "—")
  - Usage: where this size is applied
-->

| Token Name | min | default | max | Usage |
|---|---|---|---|---|
| | | | | |

---

## Z-Index Scale

<!-- Optional: document z-index layering if the project has stacked UI elements -->

| Layer | z-index | Usage |
|---|---|---|
| Base | 0 | Default page content |
| Dropdown | | |
| Sticky | | |
| Modal overlay | | |
| Modal | | |
| Toast/Notification | | |
| Tooltip | | |

---

## Breakpoints

<!-- Optional: document responsive breakpoints if applicable -->

| Token Name | min-width | max-width | Usage |
|---|---|---|---|
| | | | |
