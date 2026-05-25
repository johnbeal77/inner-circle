# Shared Sessions

## Overview

Inner Circle uses a shared session framework for temporary collaborative and realtime activities.

The shared session framework supports:
- multiplayer gameplay
- collaborative workflows
- temporary shared activities
- realtime coordination

The framework should remain reusable across:
- modules
- tools/engines
- future collaborative systems

---

## Core Principle

Shared session infrastructure owns:
- generic session lifecycle patterns
- participant coordination primitives
- session state primitives
- reconnect recovery patterns

Modules and tools define:
- session-specific behavior
- gameplay rules
- workflow rules
- module-specific state transitions

---

# Shared Session Responsibilities

Shared session infrastructure owns:

- session creation primitives
- session lifecycle primitives
- participant registration patterns
- reconnect patterns
- session expiration handling
- generic session state coordination
- session presence awareness

---

# Session Scope

Sessions are always scoped to:
- an active Circle
- a module context

Sessions should never bypass Circle permissions.

---

# Session Lifecycle

Typical lifecycle:

1. Session created
2. Participants invited
3. Participants join
4. Session enters waiting state
5. Session becomes active
6. Session completes, expires, or cancels

Modules define:
- gameplay flow
- workflow transitions
- completion conditions

---

# Session States

Shared session primitives may support:

- created
- waiting
- active
- paused
- completed
- cancelled
- expired

Modules may extend these states.

---

# Participant Management

Shared infrastructure owns:
- participant registration
- participant presence tracking
- disconnect awareness
- reconnect patterns

Modules define:
- participant roles
- gameplay meaning
- workflow responsibilities

---

# Session Presence

Participants should understand:
- who is connected
- who is disconnected
- whether session is active
- current session readiness

Presence behavior should remain reusable.

---

# Reconnect Handling

Shared session infrastructure owns:
- reconnect patterns
- session restoration primitives
- stale session cleanup

Modules define:
- gameplay pause rules
- reconnect consequences
- session-specific recovery behavior

---

# Session Expiration

Shared infrastructure may support:
- inactivity expiration
- completed session expiration
- cleanup policies

Modules may define:
- history retention
- replay behavior
- archive rules

---

# Shared Session Use Cases

Examples:
- Game Night sessions
- future collaborative planning sessions
- future shared editing sessions
- future realtime family coordination tools

---

# Realtime Integration

Shared sessions may integrate with:
- shared realtime infrastructure
- shared notifications
- shared invitations
- shared timers

Shared session infrastructure should not duplicate those systems.

---

# Shared Device Considerations

Session systems should support:
- local multiplayer
- shared devices
- reconnect recovery
- low-friction participation

---

# Security Principles

Sessions must respect:
- Circle permissions
- authentication rules
- participant authorization
- scoped realtime access

Unauthorized users must not join or observe sessions.

---

# Design Principles

- reusable session primitives
- module-independent session lifecycle
- reconnect-safe coordination
- Circle-scoped collaboration
- lightweight shared participation

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
