# Realtime Strategy

## Overview

Inner Circle uses realtime synchronization to support collaborative and multiplayer experiences.

Realtime functionality should remain:
- predictable
- Circle-scoped
- bandwidth-conscious
- state-driven

---

## Realtime Goals

Realtime systems should support:
- shared updates
- multiplayer sessions
- live status changes
- synchronized timers
- collaborative interaction

---

## Primary Backend

Realtime functionality is powered by:
- Supabase Realtime

---

## Core Principle

Realtime systems should synchronize:
> state changes

not arbitrary UI behavior.

Clients should react to authoritative shared state.

---

## Circle Scope

Realtime events must remain scoped to:
- the active Circle
- active sessions when appropriate

Users should never receive unrelated Circle events.

---

## Realtime Examples

### Family Toolbox
- grocery item checked
- chore completed
- shared list updated

### Game Night
- player joined
- prompt submitted
- timer started
- score updated
- round advanced

---

## Session Synchronization

Realtime sessions should:
- use explicit session state
- support reconnect behavior
- minimize conflicting updates

---

## Timer Synchronization

Timers should:
- use shared authoritative timestamps
- avoid device-local drift
- synchronize across all active clients

---

## Event Principles

Realtime events should:
- be meaningful
- be traceable
- trigger deterministic state updates

Avoid:
- noisy UI-only events
- unnecessary broadcasts
- duplicated events

---

## Failure Handling

Realtime systems should gracefully handle:
- disconnects
- reconnects
- stale state
- delayed updates

Clients should recover state from the backend whenever possible.

---

## Design Goals

- reliable multiplayer behavior
- scalable shared collaboration
- deterministic session synchronization
- minimal realtime complexity
