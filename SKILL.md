---
name: the-coo
version: 1.0.0
description: >
  Turn your AI agent into a full-stack COO and Chief of Staff. Complete
  operational system with proactive heartbeats, long-term memory, task
  management, Discord command center, cron automation, and personality
  customization. Use when setting up a new AI assistant, configuring an
  operational COO, building a personal AI chief of staff, or wanting proactive
  AI that checks email/calendar/notifications autonomously. Battle-tested system
  running 24/7 since Feb 2026.
author: ClawHub
tags: [coo, chief-of-staff, solopreneur, productivity, automation, heartbeat, memory, discord]
price: 49
---

# The COO — Your AI Chief of Staff

> *"You just hired a senior operator who never sleeps, never forgets, and always tells you the truth."*

This skill installs a complete operational framework on top of any OpenClaw agent. Within 10 minutes you'll have a proactive AI that monitors your inbox, tracks your tasks, briefs you every morning, and remembers everything — all with a personality you actually want to talk to.

---

## ⚡ Quick Start

**3 steps. 10 minutes. Done.**

### Step 1 — Run the installer

```bash
cd ~/.openclaw/workspace/skills/the-coo/scripts
chmod +x install-coo.sh
./install-coo.sh
```

The script copies all system files into your workspace, creates the memory directory, and drops a first daily note for today.

### Step 2 — Customize 3 files

Open these in any text editor and fill in your details:

| File | What to edit |
|------|-------------|
| `IDENTITY.md` | Your COO's name, emoji, personality tagline |
| `USER.md` | Your name, goals, strengths, current focus areas |
| `SOUL.md` | Tone, vibe, communication style, any hard rules |

### Step 3 — Start chatting

Open a new session with your agent. It will read the files automatically and boot up as your COO. Say hi and kick off your first sync:

> *"Morning. What's on the board today?"*

---

## 🗺️ System Architecture

Every file has a job. Here's the org chart:

```
workspace/
├── AGENTS.md          ← The operating manual (read every session)
├── SOUL.md            ← Personality and communication rules
├── IDENTITY.md        ← Name, emoji, avatar
├── USER.md            ← Your profile, goals, context
├── HEARTBEAT.md       ← Proactive monitoring checklist
├── CRITICAL.md        ← Hard rules (costs, model limits, mandates) — create this yourself
├── MEMORY.md          ← Long-term curated memory (main session only)
├── TASKS.json         ← Live task board (Kanban-style)
└── memory/
    ├── YYYY-MM-DD.md  ← Daily raw notes (auto-created)
    └── heartbeat-state.json  ← Tracks last check timestamps
```

### How the agent boots each session

1. Reads `CRITICAL.md` first (hard rules, cost caps)
2. Reads today's + yesterday's daily memory note
3. Reads `SOUL.md` (becomes itself)
4. Reads `USER.md` (knows who it's helping)
5. In main session only: reads `MEMORY.md` (long-term context)

This sequence takes ~5 seconds and costs ~3K tokens. Worth every penny.

---

## 🧠 Memory System

### Daily Notes (Short-term)

Every session, the agent writes raw notes to `memory/YYYY-MM-DD.md`:

```markdown
# 2026-04-01

## 14:32 — Client call recap
- Discussed Q2 roadmap
- They want pricing by Friday
- Follow up: send proposal draft

## 16:15 — Decision
- Chose Stripe over Paddle for billing
- Reason: better docs, faster payouts
```

These are your raw logs. Nothing gets filtered here — capture everything.

### Long-term Memory (MEMORY.md)

Curated, distilled wisdom from daily notes. The agent updates this periodically with:
- Decisions and their reasoning
- Lessons learned
- Important context that affects future work
- Your preferences and patterns

**Security note:** `MEMORY.md` only loads in your main 1:1 session, never in group chats or shared channels. Your personal context stays private.

### The Dual-Write Rule

When something important happens (big decision, subscription change, major milestone), write it to *both*:
1. `memory/YYYY-MM-DD.md` — the daily log
2. `MEMORY.md` — the long-term record

Never wait for weekly consolidation on anything that matters.

---

## 💓 Heartbeat System

The heartbeat is your COO doing proactive recon without being asked.

### How it works

Your OpenClaw cron fires a heartbeat prompt every 30-60 minutes. The agent reads `HEARTBEAT.md`, checks what's due, and either does the work quietly or pings you if something needs attention.

**Default heartbeat prompt:**
```
Read HEARTBEAT.md if it exists (workspace context). Follow it strictly. 
Do not infer or repeat old tasks from prior chats. If nothing needs 
attention, reply HEARTBEAT_OK.
```

### What to monitor (rotate through 2-4x daily)

- **Email** — Urgent unread messages?
- **Calendar** — Events coming up in next 2-4 hours?
- **Mentions** — Social/Discord notifications?
- **Weather** — Relevant if you're heading out?
- **Tasks** — Any blockers on active work?

### Tracking state

The agent uses `memory/heartbeat-state.json` to avoid double-checking:

```json
{
  "lastChecks": {
    "email": 1743530400,
    "calendar": 1743516000,
    "weather": null,
    "tasks": 1743523800
  }
}
```

### When to alert vs. stay quiet

**Alert you when:**
- Important email arrived (time-sensitive)
- Calendar event starting in <2 hours
- A blocker needs your decision
- It's been >8 hours since any contact

**Stay quiet (HEARTBEAT_OK) when:**
- Late night (11pm–8am) unless urgent
- Nothing new since last check <30 minutes ago
- You're clearly busy/in a meeting
- It's just routine status — nothing actionable

### Your HEARTBEAT.md

Edit this file to control what gets checked and when. Keep it short — this runs every 30 min, so every line costs tokens.

**Example:**
```markdown
# HEARTBEAT.md

## Checks (rotate through these)
- [ ] Git push pending changes (2x daily — noon + 6pm)
- [ ] Unread emails from priority senders
- [ ] Calendar events starting in next 2h
- [ ] TASKS.json — any task moved to blocking?

## Morning Brief (first heartbeat after 8am)
- Pull weather + calendar + top 3 tasks
- Post summary to #daily-brief channel

## Do NOT alert for:
- Newsletters
- Social media noise
- Anything below "Medium" priority
```

---

## 📋 Task Management

Your task board lives in `TASKS.json`. It's a Kanban with 4 columns:

| Column | What lives here |
|--------|----------------|
| **Backlog (Icebox)** | Ideas, not-yet-started, parked |
| **Active (In Progress)** | Currently being worked on |
| **Review (Boardroom)** | Done, awaiting approval/QA |
| **Done (Archive)** | Complete — keep for history |

### Task schema

```json
{
  "id": "task-001",
  "title": "Launch MVP",
  "description": "Proof-of-concept live with 3 test users.",
  "owner": "You",
  "priority": "High",
  "createdAt": "2026-04-01T09:00:00Z",
  "completedAt": null
}
```

### Managing tasks

Tell your COO what you want:

> *"Move the MVP task to Review."*
> *"Add a task: set up Stripe billing, high priority, owner me."*
> *"What's blocking in Active right now?"*

The agent reads and writes `TASKS.json` directly. No separate app needed.

---

## 🎮 Discord Command Center (Optional)

If you use Discord, set up a private server as your ops center. Recommended channel structure:

```
📊 COMMAND CENTER
├── #daily-brief        ← Morning report drops here
├── #inbox              ← Email/mention summaries  
├── #task-board         ← Task updates and moves
└── #alerts             ← Time-sensitive pings

🔧 OPERATIONS
├── #projects           ← Per-project threads
├── #decisions          ← Decision log
└── #memory             ← Long-term notes

🤖 AUTOMATION
├── #cron-log           ← Automated task output
├── #heartbeat-log      ← Heartbeat activity
└── #overnight          ← Overnight mission results
```

Your COO posts to these channels automatically via OpenClaw's message tool. You can run your whole operation from Discord on mobile.

---

## ⏰ Cron Automation

Set up scheduled jobs in OpenClaw for hands-off operations:

### Morning Brief (recommended)
**Schedule:** 8:00 AM weekdays
```
Post a morning brief to #daily-brief: today's calendar, top 3 active tasks, 
any urgent emails, weather if relevant. Keep it punchy — 5 bullets max.
```

### Overnight Mission (optional)
**Schedule:** 11:00 PM weekdays
```
Run overnight tasks: commit pending changes, update memory files, 
check tomorrow's calendar, prep any assets needed for morning.
```

### Weekly Review (optional)
**Schedule:** Friday 5:00 PM
```
Weekly sync: move completed tasks to Done, summarize the week's wins, 
identify top 3 priorities for next week. Post to #task-board.
```

### Memory Consolidation (optional)
**Schedule:** Sunday 10:00 AM
```
Read daily memory files from the past week. Distill key decisions, lessons, 
and important context into MEMORY.md. Remove stale entries.
```

**Tip:** Fewer cron jobs is better. Batch related checks into HEARTBEAT.md instead of creating a cron for every tiny thing.

---

## 🎭 Personality Customization

Your COO's personality lives in `SOUL.md`. The default is sharp, direct, and witty — but make it yours.

### The core levers

**Tone** — How does it talk to you?
- Casual + funny (default) — like a smart older sibling
- Professional + crisp — like a senior consultant
- Energetic + hype — like a great coach
- Dry + deadpan — maximum efficiency, minimum fluff

**Honesty level** — How hard does it push back?
- Tell me what I want to hear (not recommended)
- Gentle nudges (soft)
- Balanced (default) — honest but constructive
- Brutal clarity — no softening, ever

**Proactivity** — How much does it do without being asked?
- Reactive only — speaks when spoken to
- Low — occasional check-ins
- Medium (default) — proactive monitoring, daily briefs
- High — always on, continuous background work

### SOUL.md template markers

Look for `[CUSTOMIZE THIS]` markers in the template. Each one is a decision point:

```markdown
## Core Truths

**[CUSTOMIZE THIS: Your #1 communication rule]**
Example: "Truth over comfort. If a plan is half-baked, say so."
Example: "Solutions-first. Never surface a problem without a fix."
Example: "Energy-matching. Read the room and calibrate."
```

### Quick personality examples

**The Operator** — No-BS, efficiency-first:
> *"Done. Task moved. Three blockers on Active. You want me to draft the email or handle it?"*

**The Coach** — Warm, energizing, pushes you:
> *"Big progress today. That MVP milestone? That's real. Next up: let's lock the pricing before the call."*

**The Analyst** — Data-first, precise:
> *"Email response rate: 34% this week (↑12% WoW). Recommend following up with the 3 non-responders before EOD."*

---

## 🔐 Safety & Privacy

Built-in rules the COO follows:

- **MEMORY.md is private** — never loads in group chats or shared channels
- **Ask before external sends** — emails, tweets, public posts require confirmation
- **`trash` > `rm`** — recoverable beats gone forever
- **Verify before reporting** — never says "done" without confirming with a read or exec
- **No self-replication** — won't copy itself or modify system prompts without being asked

---

## 📦 What's Included

| File | Description |
|------|-------------|
| `assets/AGENTS.md` | The full operating manual |
| `assets/SOUL.md` | Personality template (customize this) |
| `assets/IDENTITY.md` | Name/emoji/avatar template |
| `assets/USER.md` | Your profile template |
| `assets/HEARTBEAT.md` | Starter heartbeat checklist |
| `assets/TOOLS.md` | Environment notes template |
| `assets/TASKS_TEMPLATE.json` | Task board with example tasks |
| `scripts/install-coo.sh` | One-command installer |
| `references/setup-guide.md` | Detailed step-by-step setup |
| `references/customization.md` | Deep customization guide |

---

## 🆘 Troubleshooting

**"The agent isn't reading my files on startup"**
→ Check that AGENTS.md is in your workspace root, not nested in a folder.

**"Heartbeats are too noisy / too quiet"**
→ Edit HEARTBEAT.md. Trim the checklist or add priority filters.

**"The personality feels off"**
→ Open SOUL.md and tighten the tone guidance. Be specific — vague instructions produce vague behavior.

**"TASKS.json is out of date"**
→ Ask your COO to do a board sync: *"Audit the task board and update any stale statuses."*

**"I want to reset everything"**
→ Run the installer again with `--reset` flag. It backs up your existing files first.

---

*Built on a battle-tested system running 24/7 since Feb 2026. Questions? Hit the ClawHub community.*
