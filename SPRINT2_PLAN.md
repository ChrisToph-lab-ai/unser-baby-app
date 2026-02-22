# Sprint 2: Parallel Implementation Plan
*Overseer: Main Claude Session*
*Date: 2026-02-22*

## Features to Implement

### High Priority
1. Due Date Editor in Settings
2. Full Data Export/Backup
3. QR Code Sync Sharing

### Medium Priority
4. Week-Specific Tips
5. Shopping Categories
6. Progress Dashboard

---

## Agent Assignments (4 Parallel Tracks)

### Track 1: Settings Enhancements
**Agent ID**: settings-agent
**File Section**: Settings section (inside `toggleSection('settings')` area)
**Tasks**:
1. **Due Date Editor**
   - Add date picker for due date (Geburtstermin)
   - Save to localStorage: `papa_due_date`
   - Update countdown when changed
   - Trigger re-calculation of all week-based data

2. **Full Data Export**
   - "Alle Daten exportieren" button
   - Collect ALL localStorage keys starting with `papa_`
   - Generate downloadable JSON file
   - Include timestamp in filename

3. **QR Code Sync**
   - Generate QR code from sync code
   - Use qrcode.js library (CDN) or canvas-based generation
   - Display QR code when sync is enabled
   - "QR Code anzeigen" button

**Output**: Modified settings HTML, new functions for export/QR

---

### Track 2: Week-Specific Tips
**Agent ID**: tips-agent
**File Section**: Tip of Day section + tips data structure
**Tasks**:
1. Create comprehensive tips database organized by week (SSW 1-40)
2. Show tips relevant to current pregnancy week
3. Add "previous tip" / "next tip" navigation
4. Store viewed tips to avoid repetition
5. Fallback to general tips if week-specific not available

**Data Structure**:
```javascript
const WEEKLY_TIPS = {
    13: ["Tip for week 13...", "Another tip..."],
    14: ["Tip for week 14..."],
    // etc
};
```

**Output**: New tips data structure, modified tip rendering

---

### Track 3: Shopping Categories
**Agent ID**: shopping-agent
**File Section**: Shopping section (Einkaufsliste)
**Tasks**:
1. Reorganize shopping items into categories:
   - 👕 Kleidung (Clothing)
   - 🍼 Stillen & Füttern (Feeding)
   - 😴 Schlafen (Sleep)
   - 🛁 Pflege & Hygiene (Care)
   - 🚗 Unterwegs (On-the-go)
   - 🏠 Kinderzimmer (Nursery)

2. Add collapsible category headers
3. Show category progress (3/5 items checked)
4. Maintain backward compatibility with existing data

**Output**: New category UI, modified shopping data structure

---

### Track 4: Progress Dashboard
**Agent ID**: dashboard-agent
**File Section**: New section after header OR in header
**Tasks**:
1. Calculate overall completion percentages:
   - 2. Trimester tasks: X%
   - 3. Trimester tasks: X%
   - Custom todos: X%
   - Shopping list: X%
   - Overall: X%

2. Display visual progress ring or bar
3. Show "days until due date" prominently
4. Motivational message based on progress

**CSS**: Progress ring using conic-gradient or SVG

**Output**: New dashboard section, progress calculation functions

---

## Dependency Graph

```
Track 1 (Settings) ─────────────────┐
Track 2 (Tips) ─────────────────────┼─── Merge & Validate ─── SW v5 ─── Deploy
Track 3 (Shopping) ─────────────────┤
Track 4 (Dashboard) ────────────────┘
```

## Conflict Analysis

| Track | File Section | Potential Conflicts |
|-------|--------------|---------------------|
| Track 1 | Settings (~lines 700-800) | None - isolated section |
| Track 2 | Tips (~lines 489-496) + JS | None - isolated section |
| Track 3 | Shopping (~lines 600-650) | None - isolated section |
| Track 4 | Header area + new section | Minor - needs careful placement |

**Conclusion**: All 4 tracks can run in parallel safely.

---

## Merge Strategy

1. Each agent outputs specific code blocks with line markers
2. Overseer validates no overlapping edits
3. Merge order: Settings → Tips → Shopping → Dashboard
4. Update service worker to v5
5. Run validation tests
6. Commit and push

---

## Expected Outcomes

After Sprint 2:
- Users can edit due date directly
- One-click full data backup
- Easy QR code sharing for partner setup
- Relevant daily tips for current week
- Organized shopping by category
- Visual progress overview

Total new lines estimated: ~600-800
