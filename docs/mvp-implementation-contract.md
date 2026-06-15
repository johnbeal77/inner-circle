# MVP Implementation Contract

## Overview

This document defines the implementation contract for the Inner Circle MVP.

Its purpose is to:
- reduce implementation ambiguity
- establish shared behavior expectations
- support reconnect-safe collaboration
- define authoritative state behavior
- prevent accidental architecture drift

This document is implementation-focused.

It exists to guide development of the MVP.

---

# Core Principle

The backend is the authoritative source of shared truth.

Clients may:
- display state
- predict state
- cache state

Clients must not become the authoritative source of shared multiplayer state.

---

# Session Model

A session represents a shared live activity.

Examples:
- Game Night session
- future trivia session
- future tabletop session

Sessions own:
- participants
- session state
- timers
- shared coordination
- completion status

Modules define session meaning.

Shared infrastructure defines session behavior.

---

# Participant Model

Participants exist within sessions.

Participants may be:
- authenticated users
- future guests
- future local/shared-device players

Participants should be tracked independently from authentication.

Session behavior should depend on participant identity rather than authentication identity.

---

# Authoritative Actions

Shared state changes occur through actions.

Examples:
- join session
- leave session
- submit prompt
- assign prompt
- start round
- end round
- score point
- complete session

Actions should be:
- explicit
- validated
- deterministic
- replayable when practical

---

# State Versions

Shared state should use version tracking.

Purpose:
- reconnect recovery
- duplicate event protection
- synchronization consistency

When shared state changes:
- state version increases
- clients receive updated state
- clients reconcile to authoritative state

Clients should not assume local state remains authoritative.

---

# Idempotency

Actions should be safe against duplication whenever practical.

Examples:
- duplicate score submission
- duplicate prompt assignment
- duplicate timer completion
- duplicate reconnect events

The same action should not produce multiple outcomes unintentionally.

---

# Realtime Updates

Realtime updates exist to distribute authoritative state.

Realtime events should:
- communicate state changes
- remain lightweight
- avoid becoming independent business logic

Shared truth should remain in authoritative state.

---

# Timers

Timers should be authoritative.

Timer expiration should not depend on a single client device.

Timer behavior should:
- survive reconnects
- remain synchronized
- support restoration

Modules define timer meaning.

Shared infrastructure defines timer behavior.

---

# Reconnect Recovery

Reconnect safety is a foundational MVP requirement.

Reconnect behavior should:
- restore session participation
- restore current state
- restore timer state
- restore participant visibility

Reconnect recovery should not require restarting a session.

---

# Validation

Shared actions should be validated before state changes occur.

Validation should remain:
- centralized
- predictable
- reusable

Modules may define additional validation rules.

---

# Error Handling

Errors should be:
- understandable
- actionable
- recoverable when practical

Shared infrastructure should provide common error patterns.

Modules may provide module-specific messaging.

---

# MVP Scope Boundary

This document applies to:
- shared sessions
- realtime synchronization
- timers
- participant coordination
- reconnect recovery
- authoritative state behavior

This document does not define:
- UI implementation details
- module-specific gameplay rules
- future post-MVP systems

---

# Design Principle

The MVP should favor:
- simplicity
- determinism
- reconnect safety
- clear ownership
- maintainability

When implementation decisions are unclear:
- prefer the simpler solution
- preserve authoritative state
- preserve ownership boundaries
- avoid speculative architecture
