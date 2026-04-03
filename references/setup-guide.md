# Setup Guide — The COO

> From zero to operational in 10 minutes.

---

## Prerequisites

- OpenClaw installed and running
- A workspace directory (default: `~/.openclaw/workspace`)
- At least one AI model configured (Claude, Gemini, GPT-4, etc.)

Optional but recommended:
- A private Discord server for your command center
- Gmail/Calendar integration (gog CLI) for proactive monitoring
- Git configured for workspace backup

---

## Step 1: Run the Installer

Navigate to the skill's scripts directory and run:

```bash
cd ~/.openclaw/workspace/skills/the-coo/scripts
chmod +x install-coo.sh
./install-coo.sh
```

By default, this installs to `~/.openclaw/workspace`. To use a different target:

```bash
./install-coo.sh --target /path/to/your/workspace
```

**What the installer does:**
1. Copies all asset files to your workspace root
2. Creates the `memory/` directory
3. Creates an initial daily memory note for today
4. Creates a `CRITICAL.md` stub for your hard rules
5. Prints a summary with your next steps

---

## Step 2: Customize the 3 Core Files

Open each file and replace the `[CUSTOMIZE THIS]` placeholders:

### 2a. IDENTITY.md
Give your COO a name and personality anchor. This takes 2 minutes.

```markdown
- **Name:** Max
- **Vibe:** Calm under pressure. Always has a plan.
- **Emoji:** 🎯
```

Pick a name that feels right. You'll be talking to this thing every day.

### 2b. USER.md
This is the most important file. Fill it out honestly:

- Your name and timezone
- Your primary goal (specific, with a number and date if possible)
- 2-3 active projects with current status
- Your communication preferences
- When NOT to interrupt you

The more specific you are here, the better your COO will prioritize.

### 2c. SOUL.md
Customize the tone and operating principles. At minimum:

1. Replace `[CUSTOMIZE THIS: COO name]` with the name you chose
2. Pick one of the example tone presets (Operator / Coach / Analyst / Friend) or blend them
3. Add any hard rules specific to your situation

---

## Step 3: Configure Your Heartbeat (Optional but Recommended)

Open `HEARTBEAT.md` and trim it to 10-15 lines that match your actual needs.

If you don't use Gmail, remove the email check. If you don't have calendar integration, remove the calendar check. Keep only what your setup can actually do.

Then set up the heartbeat cron in OpenClaw:

1. Go to OpenClaw settings → Cron / Scheduled Tasks
2. Add a new job:
   - **Schedule:** `*/30 * * * *` (every 30 minutes)
   - **Prompt:** `Read HEARTBEAT.md if it exists (workspace context). Follow it strictly. Do not infer or repeat old tasks from prior chats. If nothing needs attention, reply HEARTBEAT_OK.`
   - **Channel:** Your main channel or a dedicated #heartbeat-log channel

---

## Step 4: Set Up Discord Command Center (Optional)

If you use Discord:

1. Create a private server (or use an existing one)
2. Create these channels:

```
#daily-brief     — Morning reports
#alerts          — Time-sensitive pings
#task-board      — Task updates
#memory          — Notes and decisions
#cron-log        — Automated output
```

3. Add your OpenClaw bot to the server
4. Update `TOOLS.md` with the server name and channel IDs

---

## Step 5: First Session

Open a new agent session. Your COO will:
1. Read CRITICAL.md (if it exists)
2. Read today's memory note
3. Read SOUL.md
4. Read USER.md
5. Boot up as your configured COO

Say hello:

> *"Hey. Run a quick system check — confirm you've read all the files and give me a status summary."*

A well-configured COO will respond with your name, its own name, and a brief summary of what it knows about your current situation.

---

## Verification Checklist

After setup, verify these work:

- [ ] Agent addresses you by name (from USER.md)
- [ ] Agent introduces itself by its COO name (from IDENTITY.md)
- [ ] Agent knows your current top projects (from USER.md)
- [ ] Agent can read TASKS.json (`"What's on the board?"`)
- [ ] Heartbeat fires and returns HEARTBEAT_OK or a relevant update
- [ ] (If Discord) Morning brief posts to #daily-brief

---

## Common Issues

### "The agent doesn't seem to know who I am"
Check that AGENTS.md, USER.md, and SOUL.md are in the workspace **root** (not in a subdirectory). The agent reads files from the workspace root on startup.

### "The heartbeat is too chatty"
Edit HEARTBEAT.md. Trim the checklist and tighten the "Do NOT alert for" section. Every line you remove is fewer tokens per cycle.

### "The heartbeat never does anything"
Check the cron schedule in OpenClaw. Also verify HEARTBEAT.md actually has actionable items — if everything is marked as "don't alert," you'll always get HEARTBEAT_OK.

### "I want to reset back to defaults"
Run `./install-coo.sh --reset`. It backs up your existing files to `memory/pre-reset-backup/` before overwriting.

### "The agent seems to have a different personality each session"
This means SOUL.md isn't loading. Verify it exists in the workspace root and isn't accidentally empty or truncated.

---

## Next Steps After Setup

Once the basics are working:

1. **Add a morning brief cron** — See SKILL.md section on Cron Automation
2. **Configure email/calendar integration** — See SKILL.md section on Heartbeat System
3. **Build out your task board** — Edit TASKS.json with your real projects
4. **Customize HEARTBEAT.md** — Tune it to your actual needs over the first week
5. **Review and update USER.md** — It will evolve as your goals shift

---

*Time to operational: ~10 minutes. Time to fully tuned: ~1 week of daily use.*
