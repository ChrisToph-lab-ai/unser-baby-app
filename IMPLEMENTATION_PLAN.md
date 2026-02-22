# Parallel Implementation Plan
*Overseer: Main Claude Session*
*Date: 2026-02-22*

## Agent Assignments

### Track 1: Sync Status & Data Management
**Agent ID**: sync-agent
**File Section**: Settings section (~lines 377-450), saveData function, Firebase sync code
**Tasks**:
1. Add sync status indicator in header/settings ("Synced ✓", "Syncing...", "Offline")
2. Display last sync timestamp in settings
3. Add visual feedback when sync occurs
4. Add backup reminder notification (weekly)

**Output**: Modified syncToCloud(), loadData(), and new status display functions

---

### Track 2: Task Management
**Agent ID**: task-agent
**File Section**: Custom todos section (~lines 352-365), trimester task rendering
**Tasks**:
1. Add "Show completed" toggle for all task lists
2. Add edit button for custom todos (inline editing)
3. Add delete button for custom todos
4. Keep "Done" section but allow undo/re-activate

**Output**: New toggleCompletedVisibility(), editCustomTodo(), deleteCustomTodo() functions

---

### Track 3: Contraction Timer
**Agent ID**: timer-agent
**File Section**: Geburtstag-Tool section (~lines 244-278)
**Tasks**:
1. Add localStorage persistence for contraction data
2. Add wake lock to prevent screen sleep during timing
3. Add visual chart showing contraction pattern
4. Add "Share with hospital" export feature

**Output**: Enhanced startContractionTimer(), new contractionChart(), exportContractions() functions

---

### Track 4: Appointment Reminders
**Agent ID**: appointment-agent
**File Section**: Appointments section (~lines 284-298)
**Tasks**:
1. Request browser notification permission
2. Schedule notifications for appointments (24h and 1h before)
3. Add notification toggle in settings
4. Show upcoming reminders list

**Output**: New scheduleReminder(), requestNotificationPermission(), checkUpcomingReminders() functions

---

## Dependency Graph

```
Track 1 (Sync) ─────────────────┐
Track 2 (Tasks) ────────────────┼─── Merge & Validate ─── Service Worker Update ─── Test
Track 3 (Timer) ────────────────┤
Track 4 (Appointments) ─────────┘
```

## Merge Strategy
1. Each agent outputs specific code blocks
2. Overseer validates no conflicts
3. Merge in order: Sync → Tasks → Timer → Appointments
4. Update service worker version to v4
5. Run integration tests

## Conflict Prevention
- Track 1: Only touches sync/settings code
- Track 2: Only touches todo rendering code
- Track 3: Only touches contraction timer code
- Track 4: Only touches appointment code

These sections are independent - parallel execution is safe.
