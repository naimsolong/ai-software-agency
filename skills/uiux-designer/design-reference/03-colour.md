# Design Reference: Colour

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 78-161

---

## Core Principle: One Brand Colour

Choose ONE primary brand colour. Multiple colours compete for attention and create visual noise.

**Why one colour?**
- Simpler visual language
- Clearer interaction signals
- Easier to maintain consistency
- Works across all mediums

---

## Accessible Colour Palette

### Contrast Requirements

| Element | Minimum Ratio |
|---------|---------------|
| Primary button | 3:1 |
| Small text (<14px) | 4.5:1 |
| Body text (≥14px) | 4.5:1 |
| Large text (≥18px regular / ≥14px bold) | 3:1 |

### 6-Colour Palette Structure

Create 6 colour variations for each mode (light/dark):

#### Foreground Colours (on backgrounds)
1. **Brand** — Primary interactive elements (buttons, links)
2. **Text strong** — Primary text, headings
3. **Text weak** — Secondary text, labels
4. **Stroke strong** — Borders, dividers
5. **Stroke weak** — Subtle borders, disabled states
6. **Fill** — Input backgrounds, cards

#### 7th Colour: Neutral White/Black
- White in light mode
- Near-black in dark mode

---

## Colour Assignment Rules

### Interactive Elements
- **Primary buttons:** Brand colour background + neutral text
- **Text links:** Brand colour text
- **Focus states:** Brand colour outline (2px)

### Non-Interactive Elements
- **Headings:** Text strong
- **Body text:** Text strong or text weak
- **Borders:** Stroke strong or stroke weak
- **Backgrounds:** Fill or neutral

### Brand Colour Usage
- Only for interactive elements
- Never for decorative purposes
- Consistent throughout interface

---

## System Colours (Semantic Meanings)

| Colour | Meaning | Usage |
|--------|---------|-------|
| **Red** | Error, destructive, urgent | Alerts, delete actions |
| **Green** | Success | Confirmations, positive states |
| **Amber** | Warning | Caution states |

### Avoid Conflicts

If your brand colour is red, green, or amber:
- Don't use it for interactive elements
- Creates confusion with system meanings
- Use neutral colours instead

---

## Light Mode Colour Palette

### Formula
Mix brand colour with neutral to create 6 usable foreground colours:

| Colour | Mix Ratio | Purpose |
|--------|-----------|---------|
| Brand (100%) | Pure brand | Primary actions |
| Text strong (100%) | Pure brand | Text, headings |
| Text weak (30%) | 30% brand, 70% black | Secondary text |
| Stroke strong (60%) | 60% brand, 40% black | Strong borders |
| Stroke weak (20%) | 20% brand, 80% black | Subtle borders |
| Fill (10%) | 10% brand, 90% black | Backgrounds |

### Brand Colour on White
- Brand on white = high contrast
- Suitable for primary actions
- Works for text links

---

## Dark Mode Colour Palette

### Same 6 Variations, Different Values

| Colour | Mix Ratio | Purpose |
|--------|-----------|---------|
| Brand (100%) | Pure brand | Primary actions |
| Text strong (100%) | Pure brand | Text, headings |
| Text weak (30%) | 30% brand, 70% white | Secondary text |
| Stroke strong (60%) | 60% brand, 40% white | Strong borders |
| Stroke weak (20%) | 20% brand, 80% white | Subtle borders |
| Fill (10%) | 10% brand, 90% white | Backgrounds |

### Dark Backgrounds
- Use a slightly lighter grey (not pure black)
- Better screen rendering
- Reduces eye strain

---

## State Layers (Hover/Press/Focus)

### Transparent Overlay Technique

Add transparent layers on top of interactive elements:

| State | Overlay | Effect |
|-------|---------|--------|
| Hover | Fill colour (10%) | Subtle highlight |
| Press | Stroke weak (20%) | Darken on click |
| Focus | 2px brand outline | Clear indicator |
| Disabled | 10% stroke weak | Reduced opacity |

### Implementation
```
Default → No overlay
Hover → +Fill overlay
Press → +Stroke overlay
Focus → +Brand outline
```

---

## Handling Low Contrast Brand Colours

### Light Brand Colours (e.g., Yellow)
- Won't meet contrast on light backgrounds
- Solutions:
  1. Darken slightly for accessibility
  2. Add text shadow to buttons
  3. Use text colour for interactive elements
  4. Add borders to buttons (3:1 ratio)

### Dark Brand Colours on Dark Backgrounds
- Apply same border technique
- Or opt for black/white aesthetic

---

## Colour Naming Conventions

### Two-Level Naming System

#### 1. Primitive Colours
Named by appearance + number (0-1000 for contrast level)
```
[colour].[number]
grey.light.1000
grey.light.700
grey.light.500
```

#### 2. Semantic Colours (Tokens)
Named by purpose
```
text.success
background.primary
border.default
```

### Benefits
- Easy to switch light/dark modes
- Single source of truth
- Consistent application

---

## Multi-Brand Colour Strategy

If multiple brand colours exist:
1. Use highest contrast for interactive elements
2. Use others sparingly (decorative only)
3. Never mix interactive colours
4. Reserve secondary colours for:
   - Backgrounds
   - Icons
   - Illustrations
   - Borders

---

## Quick Reference

| Element | Light Mode | Dark Mode |
|---------|------------|-----------|
| Primary button | Brand bg + neutral text | Brand bg + neutral text |
| Text link | Brand text | Brand text |
| Primary text | Text strong | Text strong |
| Secondary text | Text weak | Text weak |
| Borders | Stroke strong/weak | Stroke strong/weak |
| Card backgrounds | Fill | Fill |

### Contrast Check
- Buttons: 3:1 minimum
- Text: 4.5:1 minimum
- Test with accessibility tools

---

## Key Takeaways

1. **One brand colour** — Simplicity wins
2. **6-colour palette** — Enough variety, not overwhelming
3. **Consistent usage** — Brand for actions, others for structure
4. **Test accessibility** — Use contrast tools
5. **State layers** — Transparent overlays for interactions
6. **Name systematically** — Primitive + semantic naming