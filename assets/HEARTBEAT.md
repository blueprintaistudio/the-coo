# HEARTBEAT.md

<!-- ============================================================
     This file controls what your COO checks proactively.
     It runs every ~30-60 minutes via the heartbeat cron.
     
     KEEP IT SHORT. Every line costs tokens on every heartbeat.
     Aim for <20 lines total. Remove checks you don't need.
     ============================================================ -->

## 🔁 Rotating Checks (do 2-3 per heartbeat, not all at once)

- [ ] **Email** — Any unread messages from priority senders? Flag if urgent.
- [ ] **Calendar** — Events starting in next 2 hours? Prep needed?
- [ ] **Tasks** — Any active tasks newly blocked? Owner unresponsive >24h?
- [ ] **Mentions** — Social/Discord notifications worth surfacing?

## ⏰ Scheduled Actions

### Morning Brief (first heartbeat after 8am, weekdays)
Pull and post to `#daily-brief`:
- Weather (if outdoor activity likely)
- Today's calendar events
- Top 3 active tasks
- Any urgent emails from overnight

### Git Sync (noon + 6pm)
- Check for uncommitted changes in workspace
- If yes: commit + push with timestamp message

### EOD Wrap (last heartbeat before 10pm)
- Any open loops from today that need a note?
- Anything to prep for tomorrow morning?

## 🚫 Do NOT Alert For

- Newsletters / marketing emails
- Social media noise (likes, follows, non-mentions)
- Tasks below "Medium" priority
- Anything that can wait for the next sync
- After 11pm or before 7am (unless marked URGENT)

## 🛑 Silence Window

Quiet hours: **11:00 PM – 7:00 AM**
Override: Only if task is tagged `URGENT` or it's a calendar event starting in <30 min

---

*Edit this file freely. Your COO will follow whatever you put here. Trim ruthlessly — lean heartbeats = cheaper operations.*
