# State and Event Architecture

## Overview

Inner Circle uses a state-driven and event-driven architecture for realtime and collaborative systems.

This is especially important for:
- Game Night
- Game Hat
- multiplayer sessions
- realtime updates

---

# Core Principle

State represents:
> the current truth of the system

Events represent:
> changes that move the system from one state to another

---

# State Principles

- State should remain deterministic
- State should be easy to reconstruct
- State should have a single source of truth
- Shared state should remain Circle-scoped

---

# Event Principles

Events should:
- represent meaningful actions
- be timestamped
- be traceable
- trigger predictable state transitions

Examples:
- player_joined
- prompt_submitted
- timer_started
- round_completed

---

# Platform-Level State

Platform state includes:
- authenticated user
- active Circle
- enabled modules
- active sessions

This state should remain centralized.

---

# Module-Level State

Modules manage their own internal state.

Examples:
- grocery list state
- Game Night session state
- Game Hat turn state

Modules should avoid mutating unrelated module state.

---

# Session State

Realtime sessions should operate as explicit state machines.

Example Game Hat states:
- waiting
- collecting_prompts
- shuffling
- active_round
- scoring
- completed

Transitions should only occur through valid events.

---

# Event Ownership

Events should originate from:
- user actions
- system timers
- realtime synchronization events

The backend should validate important state transitions.

---

# Realtime Principles

Realtime updates should:
- minimize unnecessary broadcasts
- remain Circle-scoped
- prioritize consistency over animation

---

# UI Principles

UI should react to state changes rather than manually forcing updates.

Avoid:
- duplicated temporary state
- hidden side effects
- direct UI-driven business logic

---

# Design Goals

- deterministic multiplayer behavior
- predictable realtime synchronization
- scalable collaborative systems
- debuggable event flow
