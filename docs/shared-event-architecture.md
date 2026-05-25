# Shared Event Architecture

## Overview

Inner Circle uses shared event architecture principles to coordinate meaningful state transitions across:
- platform systems
- shared infrastructure
- modules
- sessions
- tools/engines

Event systems should prioritize:
- determinism
- traceability
- scoped delivery
- reusable semantics
- synchronization consistency

---

# Core Principle

Events should represent meaningful domain state transitions rather than arbitrary UI activity.

Events are part of the platform’s architectural language.

---

# Shared Event Responsibilities

Shared event architecture defines:

- event structure conventions
- event naming conventions
- event ownership boundaries
- event propagation principles
- event lifecycle expectations
- event traceability standards

Modules and tools define:
- domain-specific meaning
- gameplay/workflow consequences
- module-specific event behavior

---

# Event Ownership

Every event should have:
- a clear owner
- a clear source
- a deterministic meaning

Examples:

## Platform Events
- CircleCreated
- MembershipUpdated
- ModuleEnabled

---

## Shared Infrastructure Events
- SessionStarted
- InvitationAccepted
- NotificationDelivered
- PresenceChanged
- TimerExpired

---

## Module Events
- GroceryListCompleted
- PlanningBoardArchived
- GameNightStarted

---

## Tool / Engine Events
- PromptAssigned
- RoundStarted
- ScoreAwarded
- ActivePlayerChanged

---

# Event Naming Principles

Event names should remain:
- descriptive
- domain-aware
- deterministic
- ownership-aware

Prefer:
- `RoundStarted`
- `InvitationAccepted`
- `SessionCompleted`

Avoid:
- vague naming
- UI-specific naming
- implementation-detail naming

Examples to avoid:
- `ButtonClicked`
- `ModalOpened`
- `UpdateThing`

---

# Event Scope

Events should remain appropriately scoped.

Examples:
- user-scoped
- Circle-scoped
- session-scoped
- module-scoped

Systems must avoid leaking events across unrelated scopes.

---

# Event Lifecycle

Typical event lifecycle:

1. Meaningful state transition occurs
2. Event emitted
3. Shared state updated
4. Realtime propagation occurs
5. Subscribers react appropriately
6. Diagnostics/analytics may record event

---

# Event Ordering

Important state events should remain:
- deterministic
- traceable
- sequentially understandable

Systems should avoid:
- ambiguous ordering
- duplicated semantic events
- uncontrolled event races

---

# Authoritative Events

Shared collaborative systems should use authoritative events.

General principle:
- backend/shared systems emit authoritative events
- local UI reacts to authoritative event flow

Clients should not invent shared truth independently.

---

# Realtime Integration

Realtime systems transport:
- authoritative events
- scoped updates
- synchronization transitions

Realtime infrastructure should not redefine event semantics.

---

# Analytics Integration

Analytics systems may consume:
- aggregate event patterns
- workflow completion trends
- session activity metrics

Analytics infrastructure should not become authoritative event ownership.

---

# Logging Integration

Diagnostics systems may record:
- event timing
- ordering behavior
- synchronization failures
- recovery events

Logs should preserve:
- privacy boundaries
- scoped visibility
- operational usefulness

---

# Shared Device Considerations

Event systems should support:
- local multiplayer
- reconnect restoration
- low-friction handoff
- temporary participation

Shared-device flows should remain deterministic.

---

# Accessibility

Event-driven interactions should remain:
- readable
- understandable
- non-overwhelming

Rapid event systems should avoid accessibility-hostile behavior.

---

# Performance Principles

Event systems should:
- avoid unnecessary event spam
- minimize duplicated propagation
- support scalable realtime coordination

Events should represent meaningful transitions rather than excessive noise.

---

# AI-Assisted Development

AI-assisted workflows should:
- use canonical event naming
- respect ownership boundaries
- avoid duplicate event semantics
- preserve deterministic event flow

AI-generated systems should align with documented event architecture.

---

# Design Principles

- meaningful domain events
- deterministic event flow
- scoped propagation
- authoritative synchronization
- reusable event semantics

---

# Ownership

Owner:
- Platform Architecture

Applies to:
- Platform Layer
- Shared Infrastructure Layer
- Modules
- Tools / Engines
