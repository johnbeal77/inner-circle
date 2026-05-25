# Shared Identity and Presence

## Overview

Inner Circle uses shared identity and presence infrastructure to coordinate user identity, participant visibility, and realtime presence awareness across the platform.

Identity and presence systems should remain reusable across:
- platform systems
- modules
- sessions
- tools/engines
- future collaborative systems

---

## Core Principle

Shared infrastructure owns:
- identity coordination
- participant presence primitives
- online/offline awareness
- reconnect identity restoration
- guest identity patterns

Modules and tools define:
- gameplay/workflow meaning
- participant responsibilities
- module-specific role behavior

---

# Shared Identity Responsibilities

Shared identity infrastructure owns:

- authenticated identity coordination
- profile identity primitives
- guest identity patterns
- display name handling
- avatar coordination
- participant identity references

---

# Shared Presence Responsibilities

Shared presence infrastructure owns:

- online/offline state
- session presence awareness
- reconnect visibility
- disconnect tracking
- participant visibility coordination

---

# Identity Scope

Identity systems may include:

## Platform Identity
Examples:
- authenticated user
- profile identity
- Circle membership identity

---

## Session Identity
Examples:
- session participant
- temporary participant state
- reconnect restoration identity

---

## Guest Identity
Examples:
- temporary local participant
- shared-device participant
- non-persistent participant identity

---

# Presence States

Examples:

- online
- offline
- reconnecting
- active
- idle
- disconnected

Modules may extend presence meaning.

---

# Presence Visibility

Participants should understand:
- who is present
- who disconnected
- who reconnected
- who is currently active

Presence visibility should remain scoped appropriately.

---

# Shared Device Considerations

Shared identity systems should support:
- local multiplayer
- temporary participants
- quick handoff between users
- privacy-aware participation

Guest participation should avoid unnecessary permanent identity storage.

---

# Reconnect Handling

Shared infrastructure owns:
- reconnect identity restoration
- participant restoration primitives
- stale presence cleanup

Modules define:
- gameplay consequences
- pause behavior
- reconnect-specific rules

---

# Realtime Integration

Presence systems integrate with:
- shared realtime infrastructure
- shared sessions
- notifications
- reconnect recovery systems

Presence infrastructure should not duplicate those systems.

---

# Privacy Principles

Identity and presence systems must respect:
- Circle boundaries
- session visibility
- participant privacy
- guest privacy expectations

Users should not receive unrelated presence visibility.

---

# Accessibility

Presence indicators should remain:
- readable
- understandable
- visually clear
- non-color-dependent

Examples:
- connected indicators
- reconnect states
- Active Player visibility

---

# Security Principles

Presence systems must:
- validate authorization
- prevent unauthorized participant visibility
- avoid identity leakage across Circles

Guest identity systems should remain appropriately scoped and temporary.

---

# Performance Principles

Presence systems should:
- avoid excessive update spam
- minimize unnecessary realtime traffic
- support scalable session participation

---

# Design Principles

- reusable identity primitives
- reconnect-safe presence handling
- scoped participant visibility
- privacy-aware identity coordination
- module-independent presence infrastructure

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
