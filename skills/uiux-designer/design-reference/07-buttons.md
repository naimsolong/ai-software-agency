# Design Reference: Buttons

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 295-328

---

## Button Hierarchy

### Three Button Styles

| Style | Purpose | Visual Weight |
|-------|---------|----------------|
| **Primary** | Most important action | Highest (filled) |
| **Secondary** | Alternative/dismiss action | Medium |
| **Tertiary** | Least important action | Lowest (outline/border) |

### Visual Hierarchy Rules

1. **Primary button stands out** — Filled brand colour
2. **Secondary has less prominence** — Border or outline
3. **Tertiary is subtle** — Border only (needs 3:1 contrast)

---

## Primary Button

### When to Use

- ONE primary action per screen
- The most important action people need to take
- Helps guide users to next step

### Guidelines

- **Don't use multiple primary buttons** — They compete for attention
- If everything is "primary", nothing stands out
- Use secondary/tertiary when actions have equal importance

### Example
**Good:** Single primary "Save post" with tertiary "Cancel"
**Bad:** Multiple primary buttons for "Follow", "Message", "Share"

---

## Secondary Buttons

### When to Use

- Alternative to primary action
- Multiple actions with equal importance
- Equal-weight decisions (no bias)

### Guidelines

- Equal prominence for equal importance
- No bias toward one action
- Often paired with primary button

### Example
**Dialog:** "Report" vs "Don't report" — both equally important, use secondary buttons for both

---

## Tertiary Buttons

### When to Use

- Least important actions
- "Cancel", "Back", "Dismiss"
- Actions people might want but aren't primary

### Accessibility

**CRITICAL:** Tertiary buttons need 3:1 contrast ratio
- If only border indicates it's a button
- Colour blind users can't distinguish from plain text
- Add context, position, or spacing to help

---

## Button Design Guidelines

### Contrast Requirements

| Element | Minimum Ratio |
|---------|---------------|
| Button shape | 3:1 |
| Button text | 4.5:1 |
| Between similar buttons | 3:1 |

### Size Requirements

| Requirement | Size |
|-------------|------|
| Minimum target area | 48pt × 48pt |
| Space between buttons | 16pt |

### Visual Hierarchy

- Primary > Secondary > Tertiary
- Don't rely on colour alone
- Add shape, weight, borders for distinction

---

## Button States

### Interactive States

| State | Visual Treatment |
|-------|------------------|
| Default | Normal appearance |
| Hover | Slight highlight (Fill overlay) |
| Press | Darker (Stroke overlay) |
| Focus | Brand outline (2px) |
| Disabled | Reduced opacity |

### State Layer Technique

```
Default → No overlay
Hover → +Fill overlay (10%)
Press → +Stroke overlay (20%)
Focus → +Brand outline
Disabled → 50% opacity
```

---

## Common Button Mistakes

### 1. Multiple Primary Buttons
- Creates confusion
- Competes for attention
- Dilutes hierarchy

**Fix:** Use secondary/tertiary for less important actions

### 2. Inconsistent Shapes
- Similar function = similar appearance
- Different shapes suggest different function

**Fix:** Same shape for same function

### 3. Low Contrast
- Button must be identifiable at 3:1
- Text must be readable at 4.5:1

**Fix:** Test with accessibility tools

### 4. Relying on Colour Alone
- Colour blind users can't distinguish
- Add borders, shape, or context

**Fix:** Multiple indicators beyond colour

### 5. Similar Style for Different Functions
- If buttons look the same, they should work the same
- Different shapes suggest different behavior

**Fix:** Consistent styling for consistent actions

---

## Button Labels

### Guidelines

1. **Use action verbs** — "Save", "Delete", "Send"
2. **Be specific** — "Save article", not just "Save"
3. **Sentence case** — "Save post", not "Save Post"
4. **Keep short** — One or two words ideal

### Avoid

- Generic: "Submit", "OK", "Click here"
- Title case: "Save Changes"
- Unnecessary words: "Please save"

---

## Quick Reference

| Guideline | Requirement |
|-----------|-------------|
| Button contrast | 3:1 minimum |
| Text contrast | 4.5:1 minimum |
| Target size | 48pt × 48pt minimum |
| Button spacing | 16pt between buttons |
| Primary buttons | One per screen maximum |
| Tertiary accessibility | Needs border (3:1 contrast) |

---

## Key Takeaways

1. **One primary per screen** — Guide users clearly
2. **Equal actions = equal prominence** — No bias
3. **Tertiary needs borders** — For accessibility
4. **48pt minimum touch target** — Easy to press
5. **Action verb labels** — Clear purpose
6. **Test contrast** — Use accessibility tools