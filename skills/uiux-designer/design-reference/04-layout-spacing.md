# Design Reference: Layout and Spacing

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 163-227

---

## Layout Hierarchy

### 3-Level Structure

1. **Grid** — Overall page structure
2. **Container** — Groups of related content
3. **Components** — Individual UI elements

### Grid
- Creates the overall structure
- Divides the page into columns
- Ensures alignment and consistency

### Container
- Groups related content together
- Creates visual boundaries
- Uses background colour or borders

### Components
- Smallest building blocks
- Buttons, inputs, text, icons
- Placed within containers

---

## Grid System

### Why Use a Grid?
- Ensures elements align properly
- Creates visual rhythm
- Speeds up design decisions
- Makes responsive design easier

### Grid Properties
- **Columns** — Vertical divisions
- **Gutter** — Space between columns
- **Margin** — Space at edges

### Responsive Grid
- Mobile: 4-6 columns
- Tablet: 8-12 columns
- Desktop: 12-16 columns

---

## Container Usage

### When to Use Containers

**Use containers when:**
- Grouping related content
- Creating visual boundaries
- Structuring navigation
- Separating major sections

**Don't over-use containers:**
- Multiple grouping methods work together
- Proximity, alignment, similarity also group content
- Remove containers when other methods suffice

### Container Techniques

**Background colours:**
- Dark backgrounds for navigation
- Light backgrounds for content areas
- Shadows for elevated content

**Borders:**
- Light borders for subtle separation
- Strong borders for clear separation

---

## 4 Methods of Grouping

### 1. Container
Visual boundary around content

### 2. Proximity
Related items placed close together

### 3. Similarity
Items that look alike are perceived as related

### 4. Alignment
Items aligned in a line appear connected

**Key insight:** Use multiple grouping methods together. If items are grouped by multiple methods, you can simplify by removing one (like the container).

---

## Spacing Scale

### Use a Spacing System

Don't use arbitrary spacing values. Create a limited set:

| Token | Value |
|-------|-------|
| XS | 8pt |
| S | 16pt |
| M | 24pt |
| L | 32pt |
| XL | 48pt |
| XXL | 80pt |

### Spacing Categories

**Tight spacing:**
- Between related items
- XS (8pt) or S (16pt)

**Standard spacing:**
- Between groups
- M (24pt)

**Loose spacing:**
- Between major sections
- L (32pt) or XL (48pt)

**Extra loose:**
- Hero sections, page margins
- XXL (80pt)

---

## Content Width

### Use Meaningful Widths

| Content Type | Width |
|--------------|-------|
| Body text | 50-75 characters (ch) |
| Headlines | 5-10 words or 35-50 characters |
| Form labels | As long as needed |
| Input fields | 12-16 characters |

### Text Width Best Practice

**Narrow is better for reading:**
- 50-75 characters per line
- Prevents eye fatigue
- Easier to scan

**Too wide = harder to read:**
- Eye has to travel far
- Hard to find line beginnings
- Lose your place easily

---

## Layout Patterns

### Z-Pattern vs F-Pattern

**F-pattern:**
- Most common reading pattern
- Left to right, top to bottom
- Scan headings and first lines

**Z-pattern:**
- Used for simple, visual pages
- Top-left → top-right → bottom-left
- Landing pages, hero sections

### Apply to Your Layout

**For content-heavy pages (F-pattern):**
- Place important content top-left
- Use clear headings
- Left-align body text

**For visual pages (Z-pattern):**
- Strong visual hierarchy
- Clear CTA placement
- Simple navigation

---

## Alignment

### Alignment Principles

1. **Consistent alignment** — Use same alignment throughout
2. **Left-align by default** — Works for most content
3. **Center sparingly** — Headlines, short content only
4. **Right-align numbers** — Makes comparison easier

### Alignment Mistakes

- Mixing left/center/right alignment
- Inconsistent spacing
- Unaligned form fields
- Misaligned icons and text

---

## Responsive Layout

### Mobile-First Approach

1. Design for smallest screen first
2. Forces prioritization
3. Expand thoughtfully for larger screens

### Breakpoints

| Screen | Columns |
|--------|----------|
| Mobile | 4-6 |
| Tablet | 8 |
| Desktop | 12-16 |

### Content Stacking
- Stack content vertically on mobile
- Use horizontal layouts on desktop
- Maintain consistent spacing

---

## Key Principles

| Principle | Application |
|-----------|-------------|
| Grid system | Align all elements to grid |
| Container grouping | Use when other methods insufficient |
| Multiple grouping | Combine proximity, similarity, alignment |
| Spacing scale | Use predefined tokens, not arbitrary values |
| Content width | Keep text readable (50-75 chars) |
| Mobile first | Design small, expand thoughtfully |

---

## Quick Reference

**Spacing tokens:** XS (8pt), S (16pt), M (24pt), L (32pt), XL (48pt), XXL (80pt)

**Grouping methods:** Container, Proximity, Similarity, Alignment

**Text width:** 50-75 characters for readability

**Reading patterns:** F-pattern (content), Z-pattern (visual)

**Alignment:** Left by default, center sparingly, right-align numbers