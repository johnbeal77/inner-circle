# Shared Realtime Infrastructure

## Overview

Inner Circle uses shared realtime infrastructure to synchronize collaborative and multiplayer experiences across clients.

Realtime infrastructure is reusable across:
- modules
- sessions
- tools/engines
- future collaborative systems

---

## Core Principle

Realtime infrastructure owns:
- transport
- synchronization patterns
- connection management
- reconnect handling

Modules and tools define:
- what events mean
- how state changes behave
- module-specific gameplay or workflow rules

---

# Shared Responsibilities

Shared realtime infrastructure owns:

- realtime transport
- connection lifecycle
- reconnect behavior
- subscription management
- event propagation
- connection state awareness
- synchronization primitives

---

# Realtime Scope

Realtime behavior should remain appropriately scoped.

Examples:
- user-scoped
- Circle-scoped
- session-scoped

Users should never receive unrelated realtime activity.

---

# Authoritative State

Shared infrastructure supports authoritative state synchronization.

General principle:
- backend/shared state is authoritative
- local client state is representational

Clients should react to authoritative updates rather than inventing independent shared truth.

---

# Realtime Event Flow

Typical flow:

1. State-changing event occurs
2. Backend/shared state updates
3. Realtime event propagates
4. Connected clients receive update
5. Clients reconcile local UI state

---

# Subscription Management

Clients may subscribe to:
- Circle activity
- session activity
- module-specific events
- user-specific events

Subscriptions should:
- remain scoped
- clean up properly
- avoid unnecessary traffic

---

# Reconnect Handling

Shared realtime infrastructure owns:
- disconnect detection
- reconnect attempts
- state resynchronization patterns
- stale connection cleanup

Modules define:
- how reconnect affects module behavior
- whether gameplay pauses
- session recovery rules

---

# Shared Realtime Use Cases

Examples:
- Game Night sessions
- shared grocery lists
- chore completion updates
- collaborative planning
- future live editing systems

---

# Event Design Principles

Realtime events should:
- represent meaningful state changes
- remain lightweight
- avoid excessive noise
- support deterministic synchronization

Avoid:
- UI-only spam events
- duplicated events
- unnecessary broadcasts

---

# Shared Device Considerations

Realtime systems should support:
- reconnect recovery
- device handoff patterns
- low-friction participation

---

# Performance Principles

Realtime systems should:
- minimize bandwidth usage
- avoid redundant updates
- support scalable session activity

---

# Security Principles

Realtime subscriptions and events must respect:
- authentication
- Circle permissions
- session permissions
- privacy boundaries

Unauthorized clients must not receive restricted realtime data.

---

# Accessibility

Realtime updates should remain:
- readable
- understandable
- non-overwhelming

Rapid update systems should avoid creating accessibility problems.

---

# Design Principles

- reusable infrastructure
- authoritative synchronization
- reconnect-safe architecture
- scoped event delivery
- module-independent transport behavior

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
