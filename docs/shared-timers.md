# Shared Timers

## Overview

Inner Circle uses shared timer infrastructure for synchronized countdowns, timed workflows, and multiplayer session pacing.

Timer infrastructure should remain reusable across:
- modules
- sessions
- tools/engines
- future collaborative systems

---

## Core Principle

Shared timer infrastructure owns:
- timer primitives
- synchronization behavior
- authoritative timing patterns
- timer lifecycle handling

Modules and tools define:
- what timers mean
- how timers affect gameplay or workflows
- timer-specific rules

---

# Shared Responsibilities

Shared timer infrastructure owns:

- timer creation
- timer synchronization
- timer state transitions
- pause/resume behavior
- expiration signaling
- reconnect recovery patterns
- authoritative timestamp handling

---

# Timer States

Common timer states:

- idle
- running
- paused
- expired
- cancelled

---

# Authoritative Timing

Timers should use authoritative shared timing.

General principle:
- backend/shared timestamps are authoritative
- local device timers are visual representations

Clients should calculate remaining time from:
- authoritative start time
- duration
- synchronized current time

---

# Timer Event Flow

Typical flow:

1. Timer created
2. Timer started
3. Shared state synchronizes
4. Clients display countdown
5. Timer expires or completes
6. Expiration event generated

---

# Synchronization Principles

Timers should:
- minimize drift
- recover after reconnect
- avoid local authority conflicts
- remain deterministic across clients

---

# Pause and Resume

Shared infrastructure supports:
- pause requests
- resume requests
- preserved remaining duration

Modules define:
- when pauses are allowed
- how pauses affect gameplay/workflows

---

# Reconnect Handling

Shared timer infrastructure owns:
- timer state restoration
- remaining-time recovery
- synchronized resume behavior

Modules define:
- reconnect gameplay consequences
- timeout handling
- interruption behavior

---

# Shared Timer Use Cases

Examples:
- Game Hat round timers
- future trivia timers
- chore reminders
- cooking timers
- collaborative countdowns

---

# Accessibility

Timers should support:
- readable countdowns
- visual indicators
- audio cue integration
- reduced distraction options

Accessibility primitives should remain reusable.

---

# Performance Principles

Timer systems should:
- minimize unnecessary updates
- avoid excessive realtime traffic
- support scalable multiplayer sessions

Clients should interpolate visually when appropriate rather than requiring constant authoritative updates.

---

# Security Principles

Clients must not become authoritative for shared timer outcomes.

Important timer events:
- expiration
- completion
- timeout handling

should remain authoritative.

---

# Design Principles

- reusable timer infrastructure
- authoritative synchronization
- reconnect-safe timing
- deterministic expiration behavior
- module-independent timer primitives

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
