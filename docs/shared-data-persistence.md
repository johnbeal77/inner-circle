# Shared Data Persistence

## Overview

Inner Circle uses shared data persistence infrastructure to manage durable storage across:
- platform systems
- Circles
- modules
- sessions
- tools/engines

Persistence systems should remain reusable, scoped, and predictable.

---

## Core Principle

Persistence infrastructure owns:
- storage coordination
- persistence patterns
- lifecycle consistency
- durable state management

Modules and tools define:
- domain-specific data meaning
- gameplay/workflow rules
- module-specific retention behavior

---

# Shared Persistence Responsibilities

Shared persistence infrastructure owns:

- durable storage coordination
- persistence lifecycle patterns
- data ownership boundaries
- archival coordination
- deletion coordination
- timestamp conventions
- identifier conventions
- persistence consistency standards

---

# Persistence Scope

Data should remain appropriately scoped.

Examples:
- user-scoped
- Circle-scoped
- module-scoped
- session-scoped
- tool-scoped

Systems must avoid leaking data across scopes.

---

# Persistence Categories

Examples:

## Platform Persistence
- users
- Circles
- memberships
- permissions
- enabled modules

---

## Shared Infrastructure Persistence
- notifications
- invitations
- session primitives
- reconnect metadata
- realtime coordination metadata

---

## Module Persistence
- grocery lists
- chore systems
- planning data
- Game Night session coordination

---

## Tool / Engine Persistence
- Game Hat prompts
- score history
- round history
- gameplay state snapshots

---

# Authoritative Data

Shared persistent storage is authoritative for durable state.

General rule:
- durable shared state belongs in persistent storage
- temporary UI state remains local

---

# Session Persistence

Sessions may persist:
- participant lists
- state snapshots
- reconnect recovery data
- history summaries

Modules define:
- replay rules
- archival behavior
- retention meaning

---

# Archival Principles

Persistence systems may support:
- soft deletion
- archival states
- retention windows
- recovery flows

Modules define:
- business meaning
- replayability
- historical visibility

---

# Deletion Principles

Deletion behavior should remain:
- predictable
- privacy-safe
- permission-aware

Possible future support:
- delayed permanent deletion
- export-before-delete
- retention policies

---

# Shared Device Considerations

Persistence systems should support:
- temporary guest participation
- minimal unnecessary retention
- privacy-aware local multiplayer behavior

---

# Realtime Integration

Persistent storage may integrate with:
- shared realtime systems
- session recovery
- synchronization flows

Realtime infrastructure should not duplicate durable storage responsibilities.

---

# Validation Integration

Persistence systems should integrate with:
- shared validation
- authorization systems
- permission checks
- ownership boundaries

---

# Security Principles

Persistent storage must respect:
- authentication
- Circle permissions
- session authorization
- privacy boundaries

Unauthorized users must not access protected stored data.

---

# Performance Principles

Persistence systems should:
- avoid unnecessary duplication
- support scalable realtime workflows
- minimize excessive writes
- support efficient recovery

---

# Design Principles

- clear ownership boundaries
- scoped durable storage
- predictable retention behavior
- reconnect-safe persistence
- module-independent persistence coordination

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
