# Game Hat Trust and Fairness

## Overview

Game Hat is designed primarily for trusted social groups rather than competitive anonymous matchmaking.

The system should prioritize:
- fun
- fairness
- low friction
- social trust
- predictable behavior

---

## Core Principle

Game Hat should discourage unfair behavior without turning the experience into a heavily policed competitive system.

Inner Circle assumes:
- players generally know each other
- sessions occur in trusted social environments
- lightweight trust systems are preferable to aggressive enforcement

---

## Prompt Privacy

Prompt visibility should remain controlled.

Rules:
- Active Player sees assigned prompt
- non-active Players should not see active prompt text
- prompt pool should not be fully browsable during active play

---

## Score Trust Model

Scores are socially validated.

The Active Player selects the winning Player.

This intentionally prioritizes:
- social flexibility
- casual play
- human judgment

over:
- rigid automation
- competitive adjudication

---

## Shared Device Considerations

Shared-device play increases trust requirements.

UI should:
- reduce accidental prompt exposure
- support quick handoff between Players
- avoid unnecessary hidden complexity

---

## Host Authority

Hosts may eventually:
- remove Players
- skip prompts
- pause sessions
- cancel sessions

Host powers should remain visible and predictable.

---

## Anti-Abuse Principles

The MVP should avoid overengineering anti-cheat systems.

However, systems should still prevent:
- duplicate participation entries
- invalid state transitions
- unauthorized session access
- duplicated scoring events

---

## Backend Authority

The backend/shared session state remains authoritative for:
- session state
- participant state
- scoring events
- timer events

Clients should not become authoritative independently.

---

## Future Possibilities

Possible future additions:
- session logs
- round history review
- moderation actions
- optional stricter competitive rules

---

## Design Principles

- trust-first multiplayer
- fairness without excessive friction
- predictable authority boundaries
- socially comfortable gameplay
- lightweight moderation
