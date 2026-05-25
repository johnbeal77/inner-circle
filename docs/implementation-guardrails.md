# Implementation Guardrails

## Overview

This document defines mandatory architectural guardrails for implementation work inside Inner Circle.

Its purpose is to:
- preserve architectural consistency
- prevent infrastructure duplication
- reduce architectural drift
- maintain ownership clarity
- support long-term maintainability

These guardrails apply to:
- platform systems
- shared infrastructure
- modules
- tools/engines
- AI-assisted implementation

---

# Core Principle

Implementation must follow architecture.

Architecture must not emerge accidentally from implementation.

---

# Ownership Guardrail

Before implementing new behavior:

1. Determine ownership layer
2. Check existing shared infrastructure
3. Avoid duplicated systems
4. Reuse shared primitives whenever possible
5. Update architecture docs if ownership is unclear

Implementation without ownership clarity is not considered complete.

---

# Dependency Guardrail

Allowed dependency direction:

Platform
→ Shared Infrastructure
→ Modules
→ Tools / Engines

Forbidden:
- platform depending on module logic
- shared infrastructure depending on gameplay logic
- tools owning infrastructure behavior

---

# Shared Infrastructure Guardrail

Do not recreate infrastructure already owned elsewhere.

Examples:
- notifications
- invitations
- sessions
- timers
- realtime
- validation
- permissions
- accessibility

Modules and tools should compose shared infrastructure.

---

# State Management Guardrail

Shared collaborative systems must use authoritative shared state.

General rule:
- backend/shared state is authoritative
- local UI state is representational

Clients must reconcile against authoritative state.

---

# Realtime Guardrail

Realtime systems must:
- support reconnect recovery
- avoid duplicated event propagation
- preserve deterministic synchronization
- avoid UI-owned shared truth

Realtime behavior should remain:
- scoped
- traceable
- ownership-aware

---

# Event Guardrail

Events must represent meaningful domain transitions.

Avoid:
- UI-only event architecture
- vague event naming
- duplicated semantic events

Prefer:
- deterministic domain events
- ownership-aware event structure
- scoped propagation

---

# Session Guardrail

Session behavior should:
- use shared session primitives
- preserve reconnect safety
- support authoritative restoration
- avoid hidden local assumptions

Modules define session meaning.
Shared infrastructure defines session coordination primitives.

---

# UI Guardrail

UI should prioritize:
- familiarity
- readability
- reusable interaction patterns
- accessibility
- mobile-first usability

Avoid:
- unnecessary novelty
- one-off interaction systems
- duplicated UI components

---

# Accessibility Guardrail

Accessibility is foundational.

Implementation must consider:
- readable text
- large tap targets
- reduced motion support
- non-audio-only interaction
- predictable navigation

Accessibility should not become deferred cleanup work.

---

# Shared Device Guardrail

Shared-device participation is a platform-level requirement.

Implementation should support:
- local multiplayer
- quick device handoff
- privacy-aware prompt reveal
- reconnect-safe participation

---

# Validation Guardrail

Validation must remain:
- reusable
- readable
- authoritative on backend/shared systems
- consistent across frontend/backend behavior

Avoid duplicated validation logic.

---

# Error Handling Guardrail

Error behavior should remain:
- calm
- readable
- recoverable
- consistent

Avoid:
- technical jargon in user-facing errors
- destructive silent failures
- inconsistent recovery behavior

---

# Synchronization Guardrail

Synchronization systems should prioritize:
- deterministic reconciliation
- reconnect-safe recovery
- authoritative state replacement
- scoped synchronization

Avoid:
- hidden merge behavior
- ambiguous ownership
- conflicting local assumptions

---

# Performance Guardrail

Optimize for:
- responsiveness
- synchronization stability
- scalability
- predictable interaction

Avoid:
- premature micro-optimization
- excessive realtime noise
- unnecessary architectural complexity

---

# AI-Assisted Development Guardrail

AI-generated implementation must:
- follow ownership boundaries
- reuse shared infrastructure
- avoid inventing duplicate systems
- preserve deterministic architecture
- respect canonical terminology

AI-generated code should be reviewed against architecture documentation before acceptance.

---

# Documentation Guardrail

Major implementation changes should update:
- ownership docs
- lifecycle docs
- synchronization docs
- infrastructure references
- architecture index when appropriate

Documentation is part of the architecture itself.

---

# Refactoring Guardrail

Refactoring should:
- improve ownership clarity
- reduce duplication
- stabilize architecture
- simplify systems

Avoid:
- unnecessary restructuring
- architectural churn
- repeated ownership changes

---

# Escalation Rule

If implementation conflicts with architecture:

1. Pause implementation
2. Clarify ownership
3. Update architecture docs if needed
4. Then continue implementation

Implementation should not silently override architectural decisions.

---

# Final Principle

Inner Circle prioritizes:
- long-term maintainability
- reconnect-safe collaboration
- reusable infrastructure
- deterministic systems
- socially comfortable interaction

Short-term convenience should not compromise foundational architecture.
