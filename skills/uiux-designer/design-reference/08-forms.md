# Design Reference: Forms

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 330-369

---

## Form Layout

### Single Column Layout

**Always stack form fields in a single column layout.**

| Benefit | Why it matters |
|---------|----------------|
| More efficient | Maintains consistent downward momentum |
| Lower cognitive load | No thinking about what field comes next |
| Fewer missed fields | Single path to follow; aids screen magnifier users |

**Avoid multi-column layouts** — they disrupt the natural flow and increase interaction cost.

### Label Placement

**Stack labels on top of inputs** — never beside them.

| Placement | Problem |
|-----------|---------|
| Left-aligned labels | Increases interaction cost; zig-zag eye pattern |
| Right-aligned labels | Jagged left edge makes text harder to scan |
| Labels inside fields | Fields look pre-filled; placeholder disappears on input |

**Solution:** Place labels closely above inputs — your eyes see both in one focus.

### Checkboxes and Radio Buttons

**Stack vertically.** This:
- Maintains downward momentum
- Clearly separates options (prevents mistaken selections)
- Works better with screen magnifiers

**Exception:** Short related fields (e.g., expiry date + CVC) can sit side-by-side within single column bounds.

---

## Field Marking

### Mark Both Required and Optional

**The problem with unmarked required fields:** Instructions at the top of forms are often skipped during scanning. This leaves people guessing.

**Marking rules:**
- Required fields: asterisk `*` or word "required"
- Optional fields: word "(optional)"
- Include instruction at top: "All fields are required unless marked optional"

### When to Skip Marking

You can skip marking required fields when:
1. No optional fields exist in the product
2. Short familiar forms (newsletter signup, login)
3. Single question per screen with clear explanation
4. Usability testing validates it's unnecessary

### Avoid Optional Fields with Opt-ins

**Instead of optional fields, use opt-in patterns:**

| Instead of | Use |
|------------|-----|
| Mobile number (optional) | Checkbox: "Receive updates via text" → if checked, show required mobile field |

This simplifies the form via progressive disclosure — uninterested users never see extra fields.

---

## Field Width and Style

### Match Width to Intended Input

Field width sets expectations for input length. Mismatch causes confusion.

| Field | Width |
|-------|-------|
| Australian postcode | 4 characters |
| CVC | 3-4 characters |
| Name on card | Full width |

**Don't set all fields to the same width** — the field should be just wide enough for expected input.

### Use Conventional Form Field Styles

Jakob's Law: People are familiar with conventional patterns. Unconventional styles:
- Make behavior unclear
- Increase cognitive load
- Risk breaking mental models

If modifying fields, keep iconic elements (e.g., circle on left of radio buttons) to tie to convention.

---

## Hints and Labels

### Display Hints Above Fields

Placing hints above fields:
- Helps people avoid errors before they happen
- Maintains downward momentum
- Hints below fields get covered by autofill menus and keyboards

**Example:** Tell password requirements BEFORE filling the password field, not AFTER.

### Don't Use Placeholder Text as Labels

Placeholder text disappears on input, causing problems:

| Problem | Why |
|---------|-----|
| Forgotten field purpose | Placeholder gone when typing |
| Looks pre-filled | Users skip fields they think are done |
| Poor contrast | Almost always inaccessible (too light) |

**Exception:** Single fields like search boxes can use placeholder text with 4.5:1+ contrast.

### Form Label Tips

1. Always display short descriptive label above fields
2. Add hint under label if more information needed
3. Avoid placeholder text in most cases
4. Avoid instructional verbs ("Enter email here" is redundant)

---

## Selection Patterns

### Use Radio Buttons Instead of Dropdowns

For ~10 options or fewer, radio buttons beat dropdowns:

| Dropdowns | Radio Buttons |
|-----------|---------------|
| High interaction cost | One quick interaction |
| Can be mistaken as filled | Always visible |
| Hard to scan (hidden options) | Easy to compare |

**Use dropdowns** when saving space is a priority.

### Autocomplete for Long Lists

For selections like country, use autocomplete search instead of scrolling a long dropdown.

**Tips for autocomplete:**
- Suitable when people know what they're looking for
- Keep suggestions to ~10 or fewer (avoids choice paralysis)
- Highlight differences in bold
- Break very long lists into multiple fields (industry → occupation)

### Steppers for Numeric Fields

Steppers decrease interaction cost for small numeric changes:

| Method | Interaction Cost |
|--------|------------------|
| Dropdowns | 6 clicks + 3 scrolls |
| Steppers | 4 clicks |

**Steppers aren't suitable for large changes** — interaction cost too high.

**Steppers tips:**
- 48pt minimum target area for buttons
- Place buttons horizontally (more space between them)
- Use "+/-" instead of arrows/chevrons (differentiates from dropdowns)

---

## Checkboxes and Toggles

### Checkbox vs Toggle

| Element | When to Use |
|---------|-------------|
| Checkbox | Option takes effect on submit |
| Toggle switch | Option takes immediate effect |

### Positive Phrasing for Checkboxes

**Test:** Replace checkbox with "yes" — if the sentence conflicts or is unclear, use negative phrasing.

| Negative | Positive |
|----------|----------|
| "Don't allow automatic updates" | "Allow automatic updates" |
| "Yes, don't allow automatic updates" (confusing) | "Yes, allow automatic updates" (clear) |

---

## Long Forms

### Break Into Multiple Steps

Multi-step forms decrease cognitive load and improve completion rates.

**Design tips:**
- Show total steps before starting
- Break 30 questions into 6 steps of 5 (not 30 steps)
- Order easiest to hardest (early wins)
- Show progress indicator (Goal-Gradient Effect)
- Allow review before submission

### Group Related Fields Under Headings

If you can't break into steps, group fields under section headings.

| Before | After |
|--------|-------|
| All fields listed sequentially | Postal address section + Contact details section |

This makes forms seem less overwhelming.

---

## Form Validation

### Three Approaches

| Approach | When to Use |
|----------|-------------|
| **On submit** | Simple forms, limited dev resources |
| **On blur** (after leaving field) | Most forms, good balance |
| **Instant** (while typing) | Password creation, username availability |

### Validation on Submit

**Guidelines:**
- Display errors above invalid fields (not below — keyboards cover it)
- Use red border + background shade + icon (never colour alone)
- List errors at top with links to invalid fields
- Don't disable submit button

**Advantages:** Simple to implement, no distractions while completing
**Disadvantages:** No feedback while filling, overwhelmed by multiple errors at once

### Validation on Blur

**Advantages:** Immediate feedback, fixes errors while context is fresh
**Disadvantages:** Distraction from switching, doesn't work for checkbox groups

### Instant Validation

**Wait until typing stops** before validating (introduce delay).

**Advantages:** Helps people meet criteria, immediate feedback
**Disadvantages:** Premature errors frustrate fast typists

---

## Contrast Requirements

**Form field borders: 3:1 minimum**

Low contrast borders are one of the most common UI mistakes. Light borders are hard to see for users with low vision or bright sunlight conditions.

This applies to all interactive elements: buttons, toggles, inputs, steppers, checkboxes, radio buttons.

---

## Quick Reference

| Guideline | Requirement |
|-----------|-------------|
| Layout | Single column |
| Labels | Above inputs, close proximity |
| Field marking | Mark required (*) and optional |
| Field width | Match to intended input |
| Hints | Above fields, not below |
| Dropdowns | Use radio buttons for ≤10 options |
| Autocomplete | For long lists (country, product) |
| Steppers | For small numeric changes |
| Long forms | Multi-step or grouped sections |
| Field borders | 3:1 contrast minimum |
| Validation | Choose based on complexity needs |

---

## Key Takeaways

1. **Single column layout** — maintains downward momentum, fewer missed fields
2. **Labels above inputs** — close proximity, one focus point
3. **Mark both required and optional** — avoids guessing
4. **Match field width** — sets correct expectations
5. **Hints above fields** — prevents errors, visible above keyboards
6. **Radio buttons > dropdowns** — for ≤10 options, visible and scannable
7. **Autocomplete for long lists** — faster than scrolling
8. **Steppers for numeric** — low interaction cost for small changes
9. **Multi-step long forms** — reduces overwhelm, improves completion
10. **3:1 border contrast** — essential for all interactive elements