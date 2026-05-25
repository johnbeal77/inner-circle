# Game Hat State Machine

## Overview

Game Hat operates as a deterministic state machine.

All gameplay progression occurs through explicit state transitions triggered by events.

This ensures:
- predictable multiplayer behavior
- clean realtime synchronization
- easier debugging
- reconnect safety

---

## Core Principle

Only valid events may transition the session from one state to another.

Clients should react to shared authoritative state rather than inventing local state independently.

---

## Primary States

### created

Initial session creation state.

Allowed actions:
- configure settings
- invite Players

---

### inviting

Invitations are active.

Allowed actions:
- Players accept/decline
- Host adjusts invitations

---

### waiting

Lobby/setup state.

Allowed actions:
- Players join
- Players submit prompts
- Host adjusts settings

Session cannot proceed until minimum requirements are met unless Host overrides.

---

### collecting_prompts

Prompt submission phase.

Allowed actions:
- Players submit prompts
- Host monitors completion

Transition condition:
- required prompts completed

---

### shuffling

System state.

Actions:
- validate prompt pool
- shuffle prompts
- prepare turn order

No Player interaction required.

---

### active_round

An Active Player is currently performing a prompt.

Allowed actions:
- reveal prompt
- start timer
- Players guess
- Active Player select winner

---

### scoring

Round result processing state.

Actions:
- assign points
- update leaderboard
- determine next Active Player

---

### paused

Temporary interruption state.

Possible causes:
- Host pause
- reconnect handling
- technical interruption

---

### completed

Gameplay finished normally.

Allowed actions:
- rematch
- replay
- return to lobby

---

### cancelled

Session terminated before normal completion.

---

## Valid State Flow

created
-> inviting
-> waiting
-> collecting_prompts
-> shuffling
-> active_round
-> scoring
-> active_round (loop)
-> completed

Possible interruptions:
- paused
- cancelled

---

## Event Examples

Examples of state transition events:

- session_created
- player_joined
- invite_accepted
- prompts_completed
- shuffle_completed
- timer_started
- timer_expired
- winner_selected
- round_completed
- session_paused
- reconnect_successful
- session_completed

---

## Timer Behavior

During active_round:
- timer should synchronize across all devices
- timer expiration should generate authoritative event
- local timers should not become authoritative

---

## Reconnect Principles

Disconnected Players should:
- restore current authoritative state
- rejoin active session if allowed
- avoid creating duplicate transitions

---

## Design Principles

- deterministic transitions
- explicit state ownership
- minimal hidden logic
- authoritative shared state
- predictable recovery behavior

---

## Summary

The Game Hat state machine defines the authoritative multiplayer gameplay flow for prompt-based Game Night experiences.
