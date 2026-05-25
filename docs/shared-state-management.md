# Shared State Management

## Overview

Inner Circle uses shared state management principles to coordinate:
- platform state
- realtime synchronization
- module state
- session state
- UI state

State management architecture should remain:
- predictable
- deterministic
- scalable
- reconnect-safe

---

## Core Principle

Authoritative shared state should have a single clear owner.

UI should react to state rather than invent independent truth.

---

# State Ownership Layers

## Platform State

Owned by:
- Platform Layer

Examples:
- authenticated user
- active Circle
- enabled modules
- permissions
- app-wide settings

---

## Shared Infrastructure State

Owned by:
- Shared Infrastructure Layer

Examples:
- realtime connection state
- timer synchronization state
- notification state
- session presence state

---

## Module State

Owned by:
- Module Layer

Examples:
- Game Night session coordination
- Family Toolbox workflows
- recipe organization state

---

## Tool / Engine State

Owned by:
- Tool / Engine Layer

Examples:
- Game Hat gameplay state
- prompt assignment
- score state
- Active Player state

---

# State Principles

State should be:
- deterministic
- traceable
- scoped appropriately
- recoverable after reconnect
- minimally duplicated

---

# Authoritative State

Shared collaborative systems should use authoritative backend/shared state.

General rule:
- backend/shared state is authoritative
- local UI state is representational

Clients should reconcile against authoritative state updates.

---

# UI State

UI-local state may include:
- temporary animations
- form input state
- local navigation state
- transient interaction state

UI-local state should not become authoritative shared state.

---

# Realtime State Synchronization

Realtime systems should:
- synchronize meaningful state changes
- avoid unnecessary event noise
- support reconnect recovery
- maintain deterministic transitions

Modules define:
- what state changes mean
- gameplay/workflow consequences

---

# State Recovery

Shared systems should support:
- reconnect recovery
- stale state replacement
- authoritative resynchronization

Clients should recover from backend/shared state whenever possible.

---

# Shared Device Considerations

State systems should support:
- local multiplayer
- device handoff
- reconnect recovery
- low-friction participation

---

# State Scope

State should remain appropriately scoped.

Examples:
- user-scoped
- Circle-scoped
- session-scoped
- module-scoped

Systems should avoid leaking state across scopes.

---

# Performance Principles

State systems should:
- minimize redundant updates
- avoid unnecessary rebuilds
- support scalable realtime activity

---

# Dependency Principles

Allowed ownership direction:

Platform
→ Shared Infrastructure
→ Modules
→ Tools / Engines

Lower layers may consume higher-level services.

Higher layers must not depend on lower-layer business logic.

---

# Design Principles

- single authoritative ownership
- deterministic synchronization
- reconnect-safe architecture
- scoped state boundaries
- UI reacts to state rather than owning shared truth

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
