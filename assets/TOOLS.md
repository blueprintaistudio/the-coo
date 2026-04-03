# TOOLS.md - Environment Notes

<!-- ============================================================
     Skills define HOW tools work. This file is for YOUR specifics —
     the environment details unique to your setup.
     
     Fill in what's relevant. Delete what isn't.
     ============================================================ -->

## What Goes Here

Things like:
- Device names and locations
- SSH hosts and aliases
- Preferred TTS voices
- API endpoint quirks
- Workspace paths
- Anything environment-specific that a skill wouldn't know

---

## 💻 Workspace

- **Primary workspace path:** [e.g., ~/.openclaw/workspace]
- **Secondary/backup path:** [e.g., ~/projects or a Git remote]
- **Git remote:** [e.g., github.com/you/workspace-backup]
- **Auto-commit:** [Yes/No — if yes, frequency]

---

## 🔊 Voice / TTS

- **Preferred voice:** [e.g., "Nova" / "Onyx" / leave blank for default]
- **Default speaker:** [e.g., Kitchen HomePod / Desktop / None]

---

## 📡 Integrations

### Email
- **Provider:** [e.g., Gmail / Outlook / FastMail]
- **CLI tool:** [e.g., gog / mu4e / none]
- **Priority senders:** [e.g., Comma-separated names or domains]

### Calendar
- **Provider:** [e.g., Google Calendar / Apple Calendar]
- **CLI tool:** [e.g., gog / gcalcli / none]

### Discord
- **Server:** [Server name or ID]
- **Key channels:** [e.g., #daily-brief, #alerts, #task-board]

### Other integrations
- [List any other tools, CLIs, or APIs your COO should know about]

---

## 🖥️ Devices / SSH

```markdown
### Machines
- [nickname] → [IP or hostname], user: [username]
- [nickname] → [description]

### SSH aliases (if using ~/.ssh/config)
- [alias] → [what it connects to]
```

---

## ⚙️ Model Preferences

- **Default (routine tasks):** [e.g., gemini-flash / claude-haiku]
- **Deep reasoning tasks:** [e.g., claude-sonnet / gemini-pro]
- **Sub-agents:** [e.g., always use flash unless reasoning required]
- **Cost threshold for model upgrade:** [e.g., Only use Pro if task takes >5 min or has high stakes]

---

## 📝 Notes

[Add any other environment-specific notes your COO needs to function. Camera names, smart home devices, custom scripts, whatever is unique to your setup.]

---

*Skills are shared. Your setup is yours. Keep them separate so you can update skills without losing your notes.*
