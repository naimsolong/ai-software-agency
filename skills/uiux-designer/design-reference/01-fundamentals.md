# Design Reference: Fundamentals

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 16-53

---

## Core Principles

### 1. Make it easy to use

The best interfaces are invisible — they get out of people's way and let them achieve their goals quickly and easily.

**Key guidelines:**
- Reduce interaction cost (clicks, scrolls, mouse movements)
- Remove unnecessary steps
- Make common actions obvious and accessible
- Place interactive elements where users expect them

### 2. Keep interfaces simple

Cluttered interfaces are hard to use and can overwhelm users. Strip away anything that doesn't serve a clear purpose.

**Key guidelines:**
- Remove unnecessary elements
- Use whitespace effectively
- Focus on essential features
- Maintain visual balance

### 3. Build trust through good design

Good design communicates that you care about your users' experience. Bad design can make people hesitant to use your product.

**Key guidelines:**
- Show professionalism through polish
- Be consistent in your design language
- Honour user expectations
- Deliver on promises

---

## Interaction Design

### Reduce Interaction Cost

Every click, scroll, and mouse movement has a cost. Minimize these to help users accomplish tasks faster.

**Example comparison:**
| Action | Before | After |
|--------|--------|-------|
| Add to cart | 3 clicks + scroll | 2 clicks |
| Navigation | Hidden in menu | Visible labels |

**Design patterns that reduce interaction cost:**

1. **Inline actions** — Place actions close to the content they affect
2. **Smart defaults** — Pre-fill common values
3. **Auto-complete** — Help users complete forms faster
4. **Stepper controls** — Use for small numeric changes instead of dropdowns
5. **Progressive disclosure** — Reveal options when needed

### Minimise Cognitive Load

Cognitive load is the amount of brain power required to use an interface. Lower cognitive load = easier to use.

**Quick ways to reduce cognitive load:**

1. Remove unnecessary styles, information, and decisions
2. Break up information into smaller groups
3. Use conventional design patterns people are familiar with
4. Maintain consistency — similar elements work similarly
5. Create clear visual hierarchy showing importance

---

## Design Systems

### Create a Design System in 3 Steps

A design system provides predefined options and guidelines for efficient decision-making.

#### Step 1: Set Predefined Style Options

Create limited sets of options for:

**Colour Palette:**
- Brand colour (for interactive elements)
- Text strong (primary text)
- Text weak (secondary text)
- Stroke strong (borders)
- Stroke weak (subtle borders)
- Fill (backgrounds)

**Typography Scale:**
| Element | Size | Line Height |
|---------|------|-------------|
| Heading 1 | 40px | 48px |
| Heading 2 | 32px | 40px |
| Heading 3 | 24px | 32px |
| Heading 4 | 20px | 28px |
| Small | 16px | 24px |
| Tiny | 14px | 20px |

**Spacing Scale:**
- XS: 8pt
- S: 16pt
- M: 24pt
- L: 32pt
- XL: 48pt
- XXL: 80pt

**Other Style Options:**
- 2 shadow options (raised, overlay)
- 3 border radius options (8pt, 16pt, 32pt)

#### Step 2: Create Reusable Modules

Modular design breaks interfaces into smaller, reusable parts:

1. **Start small** — Create buttons, avatars, form inputs as building blocks
2. **Combine components** — Build larger, more complex components
3. **Arrange in templates** — Create reusable page layouts

The goal: a component library or UI kit for easy management and reuse.

#### Step 3: Define Usage Guidelines

Document how and when to use each style and component. Guidelines ensure consistency across the team.

---

## Key Takeaways

1. **Accessibility first** — Interactive elements need 3:1+ contrast ratio (4.5:1 for small text)
2. **Design for mobile first** — Forces prioritization of essential elements
3. **Consistency builds trust** — Similar elements should look and work similarly
4. **Reduce decisions** — Hick's Law: fewer choices = faster decisions
5. **Test with real users** — Assumptions aren't facts

---

## Quick Reference

- **Primary button:** 3:1 minimum contrast
- **Small text (<14px):** 4.5:1 minimum contrast
- **Border radius:** Small (8pt), Medium (16pt), Large (32pt)
- **Spacing:** XS (8pt), S (16pt), M (24pt), L (32pt), XL (48pt), XXL (80pt)
- **Type scale ratio:** 1.200 (Major Third)