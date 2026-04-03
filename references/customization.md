# Customization Guide — The COO

> How to make the system feel like yours.

---

## Philosophy: Opinionated Defaults, Total Control

The COO ships with strong defaults. The personality is sharp, the heartbeat is proactive, the task board is structured. You can keep all of it, change some of it, or rebuild it entirely.

The system doesn't care. It reads files and follows instructions. You write the instructions.

---

## SOUL.md — Personality Deep Dive

This is the highest-leverage customization. A well-written SOUL.md makes every single interaction better. A vague one gives you a generic assistant.

### The 4 dimensions

**1. Honesty level**

```markdown
# Very direct (no softening):
"If a plan is bad, say it's bad. Don't cushion it."

# Balanced (honest but constructive):
"Be honest, but always pair criticism with a concrete alternative."

# Gentler (coaching style):
"Focus on what to do, not what went wrong. Frame everything as a learning."
```

**2. Proactivity level**

```markdown
# High (always on):
"Don't wait to be asked. If you spot a problem, surface it."

# Medium (default):
"Proactively monitor via heartbeat, but don't interrupt for minor things."

# Low (reactive):
"Speak when spoken to. Only flag critical blockers unprompted."
```

**3. Tone**

```markdown
# Casual:
"Talk like a smart friend. Short sentences. Real words. No jargon."

# Professional:
"Crisp and precise. Minimal small talk. Get to the point fast."

# Energetic:
"High energy. Match the pace of building something. Celebrate wins."
```

**4. Communication cadence**

```markdown
# Batch updates:
"Collect non-urgent items. Deliver in one summary. Don't drip-feed."

# Real-time:
"Surface things as they come up. I'd rather know sooner."

# End-of-day summaries:
"Hold non-urgent updates for EOD wrap. Only escalate true blockers."
```

### SOUL.md pro tips

- **Be specific.** "Be helpful and professional" means nothing. "Lead every response with the top action item, then context" is actionable.
- **Add examples.** Show the desired response style with 2-3 sample exchanges in the vibe section.
- **Iterate.** Use the system for a week, notice what bugs you, add a rule to fix it.
- **Hard rules > soft preferences.** Put non-negotiables at the bottom under "Hard Rules" so they're always applied.

---

## USER.md — Getting Good Prioritization

The COO uses USER.md to decide what matters. Vague profiles get generic advice. Specific profiles get targeted, smart help.

### What makes a good USER.md entry

❌ **Weak:** "I'm working on growing my business."

✅ **Strong:** "Primary goal: $15K MRR by September 30. Currently at $4K. Main lever: close 4 new B2B clients at $2,500/mo. Biggest constraint: I have 8 leads but haven't followed up with 5 of them."

The difference: the second one lets your COO immediately identify what to nudge you on.

### Updating USER.md over time

Review and update USER.md:
- When your primary goal changes
- When a major project ends or a new one starts
- When your constraints shift (hired someone, ran out of runway, hit a milestone)
- Monthly as a habit (takes 5 minutes)

Don't let it go stale. A 3-month-old USER.md is worse than none — it'll give you irrelevant advice with confidence.

---

## HEARTBEAT.md — Tuning Proactivity

The heartbeat is the most powerful and most expensive part of the system. Tune it carefully.

### Token cost awareness

Every heartbeat turn sends:
- The heartbeat prompt (~50 tokens)
- HEARTBEAT.md contents (~200-500 tokens, depending on length)
- Any context files referenced

At 30-minute intervals, 48 turns/day × ~800 tokens = ~38K tokens/day just for heartbeat. Keep HEARTBEAT.md lean.

### What to include

**Do include:**
- Checks that can trigger real alerts (email, calendar, tasks)
- Scheduled actions that happen on a specific time pattern
- Clear "do not alert" rules to prevent noise

**Don't include:**
- Long explanations (the COO doesn't need them)
- Checks you don't have integrations for yet
- Aspirational checks you'll "set up later" — remove them until they're real

### Heartbeat cadence options

| Cadence | Good for |
|---------|---------|
| Every 15 min | High urgency work periods, active launches |
| Every 30 min | Default — good balance of responsiveness and cost |
| Every 60 min | Low-key periods, vacation mode |
| Pause entirely | Deep work blocks, weekends |

In OpenClaw, you can also manually fire a heartbeat with: `openclaw heartbeat fire`

---

## TASKS.json — Task Board Customization

### Renaming columns

Edit the `name` field in each column object:

```json
{
  "id": "col-backlog",
  "name": "Ideas (Icebox)"  // Change this to whatever resonates
}
```

Good alternatives:
- Backlog → "Someday / Maybe" / "Parked" / "Ideas"
- Active → "In Flight" / "This Week" / "Focus"
- Review → "Boardroom" / "QA" / "Awaiting Approval"
- Done → "Shipped" / "Archive" / "Wins"

### Adding multiple boards

You can add additional boards for different areas of your life:

```json
{
  "boards": [
    { "id": "board-work", "name": "Work" },
    { "id": "board-personal", "name": "Personal" },
    { "id": "board-health", "name": "Health & Fitness" }
  ]
}
```

Ask your COO: *"What's on my Health board?"* and it will filter accordingly.

### Priority system

The default is High / Medium / Low. You can add custom values:

```json
"priority": "Critical"   // For true fires — use sparingly
"priority": "High"       // This week / blocking
"priority": "Medium"     // This month / important but not urgent
"priority": "Low"        // Backlog / nice to have
"priority": "Someday"    // Ideas, not commitments
```

---

## IDENTITY.md — Naming Your COO

A good COO name:
- Easy to say out loud
- Feels like a person, not a product
- Something you'll actually use when addressing it

Popular choices: Max, Aria, Ops, Chief, Kai, Sage, Rex, Nova

Avoid: Assistant, AI, Bot, Helper — these feel generic and you'll interact with it less naturally.

---

## Cron Automation — Advanced Scheduling

Beyond heartbeats, you can set up dedicated cron jobs for specific recurring tasks.

### Morning Brief Example

```
Schedule: 0 8 * * 1-5  (8am weekdays)
Prompt: "You are [COO_NAME]. Read USER.md and TASKS.json. 
Post a morning brief to #daily-brief:
- Today's weather (if [CITY] has outdoor-relevant forecast)  
- Calendar events today
- Top 3 active tasks
- Any urgent emails from overnight
Format: bullet points, max 5 per section, punchy."
```

### Weekly Review Example

```
Schedule: 0 17 * * 5  (5pm Fridays)
Prompt: "Weekly review time. Read TASKS.json.
1. Move any completed-looking Active tasks to Review
2. Identify top 3 priorities for next week  
3. Post summary to #task-board
4. Add a weekly summary entry to memory/[TODAY].md"
```

### Custom Overnight Mission Example

```
Schedule: 0 23 * * 1-4  (11pm Mon-Thu)
Prompt: "Overnight mission. Tasks allowed without approval:
- Commit and push pending workspace changes
- Update memory files with today's summary
- Check calendar for tomorrow, prep any notes needed
- If tomorrow has >3 meetings, draft a prep note
Post results to #cron-log."
```

---

## Advanced: CRITICAL.md

Create this file in your workspace root for hard rules that override everything else:

```markdown
# CRITICAL.md

## Hard Stops (NEVER do these without explicit confirmation)
- Never send any external message (email, SMS, tweet, Discord) without explicit approval
- Never delete files — always use trash or backup first
- Never spend money or initiate payments of any kind
- Never share MEMORY.md contents outside a main 1:1 session

## Model Rules
- Default to [MODEL] for routine tasks
- Use [EXPENSIVE_MODEL] only for: [specific high-stakes tasks]
- Sub-agents always use [CHEAP_MODEL] unless specified

## Cost Thresholds
- Autonomy threshold: tasks <$[AMOUNT] or <[TIME] of compute
- Anything above: ask first, log the decision

## Active Context (update this section as needed)
- [DATE]: [Any active constraint, focus, or temporary rule]
```

The COO reads CRITICAL.md first, before anything else. Think of it as the hard constraints that override SOUL.md preferences.

---

## Iteration Rhythm

**First week:** Use the defaults. See what feels off.

**Week 2:** Make targeted edits to SOUL.md and HEARTBEAT.md based on what's bugging you.

**Month 1:** Review USER.md. Update your goals and current focus. The system is now calibrated.

**Ongoing:** Update USER.md when goals shift. Evolve HEARTBEAT.md as integrations get added. Let MEMORY.md grow.

---

*The system that works for you is the one you actually use. Start with the defaults, tune as you go.*
