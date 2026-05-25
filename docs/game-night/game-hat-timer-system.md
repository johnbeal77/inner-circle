# Game Hat Timer System

## Overview

This document defines how Game Hat timers operate during active rounds.

Timers must remain synchronized, predictable, and authoritative across all connected devices.

---

## Core Principle

The backend/shared session state is authoritative for timer behavior.

Local device timers are visual representations only.

---

## Timer States

Possible timer states:

- idle
- counting_down
- paused
- expired
- cancelled

---

## Round Timer Flow

Typical flow:

1. Active Player receives prompt
2. Timer starts
3. Countdown synchronizes across Players
4. Round completes OR timer expires
5. Timer stops

---

## Synchronization Rules

Timers should:
- use shared timestamps
- avoid device-local authority
- recover cleanly after reconnect

Clients should calculate remaining time from:
- authoritative start timestamp
- configured duration
- current server-relative time

---

## Expiration Behavior

When timer expires:

- authoritative expiration event is generated
- round enters timeout flow
- no further guesses should count

---

## Pause Behavior

If session pauses:
- timer pauses
- remaining time preserved
- resumed timer continues from preserved value

---

## Audio and Visual Cues

Players may receive:
- countdown visuals
- warning indicators
- expiration sounds

These cues should not affect authoritative timer state.

---

## Reconnect Behavior

Reconnected Players should restore:
- current timer state
- remaining time
- round status

---

## Future Timer Options

Possible future options:
- custom durations
- no timer mode
- escalating speed rounds
- per-round timer variations

---

## Design Principles

- backend-authoritative timing
- deterministic expiration behavior
- synchronized multiplayer experience
- minimal timer drift
- reconnect-safe timer recovery
