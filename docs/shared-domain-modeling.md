# Shared Domain Modeling

## Overview

Inner Circle uses shared domain modeling principles to maintain consistent conceptual structure across:
- platform systems
- shared infrastructure
- modules
- sessions
- tools/engines

Domain modeling should prioritize:
- clarity
- ownership
- scalability
- deterministic relationships
- long-term maintainability

---

# Core Principle

Important concepts should have:
- clear definitions
- stable ownership
- predictable relationships
- reusable terminology

The same concept should not be redefined differently across modules.

---

# Domain Ownership

Each domain entity should have a clear ownership layer.

Examples:

## Platform-Owned Entities
- User
- Circle
- Membership
- Permission
- Module Registration

---

## Shared Infrastructure Entities
- Session
- Invitation
- Notification
- Presence
- Realtime Connection
- Timer

---

## Module-Owned Entities
Examples:
- Grocery List
- Chore
- Planning Board
- Game Night Session Context

---

## Tool / Engine-Owned Entities
Examples:
- Game Hat Prompt
- Round State
- Active Player
- Score Entry

---

# Shared Vocabulary

Shared concepts should use consistent naming.

Examples:

Use:
- Circle
- Session
- Participant
- Active Player
- Invitation
- Presence

Avoid:
- multiple names for the same concept
- module-specific renaming of shared entities
- ambiguous ownership terminology

---

# Entity Relationship Principles

Relationships should remain:
- traceable
- scoped appropriately
- ownership-aware
- minimally duplicated

Examples:
- Sessions belong to Circles
- Participants belong to Sessions
- Modules operate inside Circles
- Tools operate inside Modules

---

# Scope Awareness

Entities should remain appropriately scoped.

Examples:
- user-scoped
- Circle-scoped
- session-scoped
- module-scoped

Systems should avoid leaking entities across scopes unnecessarily.

---

# Canonical Ownership

Each major entity should have:
- one canonical owner
- one authoritative lifecycle definition
- one primary persistence model

Avoid:
- duplicated entity definitions
- conflicting lifecycle behavior
- fragmented ownership

---

# Lifecycle Modeling

Entities should define:
- creation behavior
- active behavior
- expiration behavior
- archival behavior
- deletion behavior

Lifecycle rules should remain deterministic.

---

# Shared Infrastructure Reuse

Reusable entities should remain infrastructure-owned.

Examples:
- invitations
- sessions
- notifications
- timers
- presence

Modules should compose infrastructure entities rather than recreate them.

---

# State Modeling

Domain state should remain:
- deterministic
- traceable
- reconnect-safe
- authoritative when shared

Shared collaborative systems should avoid ambiguous ownership.

---

# Event Modeling

Events should represent:
- meaningful state transitions
- domain-significant behavior
- traceable workflow changes

Avoid:
- UI-only domain events
- duplicated semantic events
- ambiguous event naming

---

# AI-Assisted Development

AI-assisted workflows should:
- use canonical domain terminology
- avoid inventing duplicate concepts
- respect ownership boundaries
- maintain relationship consistency

AI-generated entities should align with documented domain ownership.

---

# Documentation Expectations

Major entities should eventually document:
- ownership
- lifecycle
- relationships
- persistence behavior
- authorization behavior
- synchronization behavior

Documentation is part of domain stability.

---

# Design Principles

- canonical ownership
- shared vocabulary consistency
- deterministic entity relationships
- scoped domain boundaries
- reusable conceptual infrastructure

---

# Ownership

Owner:
- Platform Architecture

Applies to:
- Platform Layer
- Shared Infrastructure Layer
- Modules
- Tools / Engines
