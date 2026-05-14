# Design Reference: Less is More

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 55-76

---

## Core Philosophy

Minimal doesn't mean simple. A minimal interface has fewer elements but isn't necessarily easy to understand. Removing too much can harm usability.

**The goal:** Simple, not minimal. Remove distractions while preserving clarity.

---

## Visual Hierarchy

### Fix Your Visual Hierarchy First

Before adding more content or elements, fix your visual hierarchy. Poor hierarchy is often the root cause of interface problems.

**Signs of weak visual hierarchy:**
- People miss important actions
- It's hard to scan the interface
- Users make mistakes
- The page looks cluttered

**How to strengthen visual hierarchy:**
1. Make important elements larger
2. Use whitespace to separate groups
3. Apply colour strategically
4. Ensure sufficient contrast
5. Use consistent alignment

### Correct Visual Hierarchy Issues

**Problem:** Colour competes with visual hierarchy
**Solution:** Remove colour from non-essential elements to let important ones stand out

**Before:** Brand colours on many elements — nothing stands out
**After:** Colour only on primary action, neutral elsewhere

---

## Progressive Disclosure

Reveal information gradually as needed. Show only what users need to complete the current task.

**When to use:**
- Complex information that can be simplified
- Optional fields that aren't needed by everyone
- Detailed explanations some users want

**Example patterns:**
1. "Learn more" links for additional details
2. Expandable sections for optional information
3. Tooltips for contextual help

**Trade-off:** Adds extra interactions but significantly reduces cognitive load.

### Examples of Progressive Disclosure

**Text content:**
- Show summary with "Read more" link
- Use descriptive labels for links

**Forms:**
- Reveal optional fields conditionally
- Break multi-step forms into steps

---

## Content Visibility

### Make Important Content Visible

People don't use what they can't see. Hidden elements = missed opportunities.

**Principles:**
1. Don't hide important actions behind menus
2. Expose the edge of off-screen content (show scroll indicators)
3. Use clear, descriptive labels

**Navigation design:**
- Visible links vs hidden menus
- Labels that describe content

**Cards and lists:**
- Show partial content to indicate more exists
- Use edge exposure for discoverable off-screen items

---

## Mobile-First Design

### Design for the Smallest Screen First

Restricted space forces prioritization of essential elements.

**Benefits:**
1. Forces focus on what matters most
2. Prevents tendency to fill space unnecessarily
3. Results in cleaner interfaces on all screens

**Mobile first ≠ Mobile only**
- Design for mobile constraints first
- Expand thoughtfully for larger screens

---

## Decision Speed

### Reduce Choices to Speed Up Decisions

**Hick's Law:** Decision time increases with number and complexity of choices.

**4 strategies to reduce choices:**

#### 1. Remove Choices
Make sure every option earns its place. If it's not necessary, it's a distraction.

**Example:** A form with 5 fields becomes faster with 3 fields.

#### 2. Group or Categorise Choices
Break large option lists into categories. It's faster to choose a category than scan all options.

**Example:** Articles grouped by topic, not one long list.

#### 3. Break Up Choices into Multiple Steps
Divide complex decisions into sequential steps.

**Example:** Multi-step checkout process vs single long page.

#### 4. Recommend Choices
Highlight the best option or most common choice. Guide users to good decisions.

**Example:** "Recommended" badge on preferred plan.

---

## Progressive Disclosure Examples

### Text Expansion
Show summary, reveal full content on click

### Form Fields
Show optional fields only when relevant

### Detailed Information
"Learn more" or expandable sections

### Settings
Advanced options hidden by default

---

## Key Principles Summary

| Principle | Application |
|-----------|-------------|
| Simple > Minimal | Don't sacrifice clarity for looks |
| Hierarchy first | Fix hierarchy before adding elements |
| Progressive disclosure | Reveal info gradually as needed |
| Visible > Hidden | Important content must be seen |
| Mobile first | Forces essential prioritization |
| Fewer choices | Speed up decision making |

---

## Common Mistakes to Avoid

1. **Removing too much** — Critical details get hidden
2. **Using minimal aesthetic** — Vague interfaces without clear purpose
3. **Hiding important actions** — Users miss key interactions
4. **No visual hierarchy** — Everything looks equally important
5. **Too many options** — Overwhelms and slows users

---

## Quick Reference

- **Progressive disclosure** — Show less, reveal more on demand
- **Hidden vs Visible** — Important content must be discoverable
- **Mobile first** — Start small, expand thoughtfully
- **Hick's Law** — Remove, group, sequence, or recommend choices
- **Hierarchy fix** — Make important elements stand out first