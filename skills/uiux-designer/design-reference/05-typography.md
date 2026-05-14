# Design Reference: Typography

## Source
*Practical UI Design, 2nd Edition by Adham Dannaway*
Pages 229-264

---

## Core Principles

### Use a Single Sans Serif Typeface

**Why single?**
- Better legibility
- Neutral mood (doesn't distract from content)
- Simpler, less cluttered appearance
- Easier to maintain consistency

### Typeface Classifications

| Type | Characteristics | Best Use |
|------|-----------------|----------|
| **Sans Serif** | No decorative tails, simple, modern | Interface text, body |
| **Serif** | Decorative tails, traditional | Headlines, editorial |
| **Script** | Handwriting-based | Decorative, large sizes only |
| **Display** | Decorative, designed for large sizes | Hero text, branding |
| **Monospaced** | Equal character width | Code, numbers |

---

## Choosing a Sans Serif Typeface

### Tips for Selection

1. **Choose popular, tried-and-tested typefaces**
   - Sort font directories by popularity
   - Less risk of poor quality

2. **Look for variety of weights**
   - Light, Regular, Medium, Semibold, Bold
   - More flexibility in design

3. **Check x-height and letter spacing**
   - Taller lowercase letters = better legibility
   - Greater letter spacing = easier reading at small sizes

4. **Consider language support**
   - Need multiple languages? Ensure coverage

5. **Look for OpenType features**
   - Better cross-platform support
   - Advanced character support

6. **Use system defaults when unsure**
   - Native platform fonts are tested and fast

---

## Adding Personality with a Second Typeface

### Headings Can Have Personality

For more personality, introduce a second typeface for headings only.

**Rules:**
- Use second typeface ONLY for headings
- Don't worry about small-size legibility
- Keeps body text simple and readable

### Moods Evoked by Typefaces

| Mood | Typeface Style |
|------|---------------|
| Neutral, minimal, modern | Sans serif |
| Traditional, established, classic | Serif |
| Fun, soft, playful | Rounded sans serif |
| Personal, handmade | Casual script |
| Formal, feminine, elegant | Formal script |
| Chic, modern, luxurious | Light sans serif |

---

## Typography Scale

### Type Scale Ratio: 1.200 (Major Third)

| Element | Size | Line Height |
|---------|------|-------------|
| Heading 1 | 40px | 48px |
| Heading 2 | 32px | 40px |
| Heading 3 | 24px | 32px |
| Heading 4 | 20px | 28px |
| Body | 16px | 24px |
| Small | 14px | 20px |

### Creating a Type Scale

1. Start with base size (16px for body)
2. Multiply by ratio for larger sizes
3. Divide for smaller sizes
4. Define line heights (usually 1.25-1.5x size)

---

## Font Weights

### Common Weights

| Weight | Usage |
|--------|-------|
| Light (300) | Large display text |
| Regular (400) | Body text, UI labels |
| Medium (500) | Emphasis, subheadings |
| Semibold (600) | Important labels |
| Bold (700) | Headings, strong emphasis |

### Guidelines
- Use 2-3 weights maximum
- Regular for body, Bold for headings
- Avoid Light for body text (harder to read)

---

## Line Length (Measure)

### Optimal Line Length

**Body text:** 50-75 characters per line

**Headlines:** 5-10 words or 35-50 characters

### Why Line Length Matters

**Too long:**
- Hard to find next line
- Eye loses its place
- Fatigue sets in

**Too short:**
- Too many line breaks
- Disrupts reading rhythm
- Poor use of space

### Implementation
```css
/* Limit paragraph width */
p {
  max-width: 65ch;
}
```

---

## Line Height

### Guidelines

| Text Size | Line Height |
|-----------|-------------|
| Large headings | 1.0-1.2x |
| Body text | 1.4-1.6x |
| Small text | 1.3-1.5x |

### Proportional Scaling
- Larger text → smaller line height ratio
- Smaller text → larger line height ratio
- Provides consistent visual rhythm

---

## Letter Spacing

### When to Adjust

**Increase spacing for:**
- ALL CAPS headings (add 0.05-0.1em)
- Very large display text
- Small UI labels

**Default is usually fine for:**
- Body text
- Regular paragraphs

### Example
```css
h1 {
  letter-spacing: -0.02em;  /* Tighter for large headings */
}

.uppercase-label {
  letter-spacing: 0.05em;  /* Looser for caps */
}
```

---

## Text Alignment

### Alignment Rules

| Alignment | Use Case |
|-----------|----------|
| **Left** (default) | Body text, content |
| **Center** | Short headlines, quotes |
| **Right** | Numbers in tables, labels |

### Avoid
- Justified text (creates uneven spacing)
- Mixed alignment within same content

---

## Font Sizing for Hierarchy

### Clear Hierarchy Rules

1. **Heading size ratio**
   - H1 is significantly larger than body
   - Step down sizes gradually

2. **Weight contrast**
   - Headings: Bold
   - Body: Regular
   - Creates visual separation

3. **Colour contrast**
   - Primary text: Strong
   - Secondary text: Weak
   - Adds hierarchy without size changes

---

## Quick Reference

| Element | Rule |
|---------|------|
| Typeface | Single sans serif for body |
| Headings | Can add second typeface for personality |
| Type scale | 1.200 ratio (40px, 32px, 24px, 20px, 16px, 14px) |
| Line length | 50-75 characters for body text |
| Line height | 1.4-1.6x for body, 1.0-1.2x for headings |
| Font weights | 2-3 max (Regular + Bold is common) |
| Alignment | Left default, center sparingly, right-align numbers |

---

## Key Takeaways

1. **Single sans serif** is safest for interfaces
2. **Second typeface** can add personality to headings only
3. **Type scale** creates consistent hierarchy
4. **Line length** (50-75 ch) is crucial for readability
5. **Line height** scales with text size
6. **System fonts** are a reliable default choice