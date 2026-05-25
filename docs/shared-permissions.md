# Shared Permissions and Authorization

## Overview

Inner Circle uses shared permission and authorization infrastructure to manage access across:
- platform systems
- Circles
- modules
- sessions
- tools/engines

Permission systems should remain reusable, predictable, and Circle-aware.

---

## Core Principle

Authorization behavior belongs to shared infrastructure and platform architecture rather than individual modules.

Modules and tools may define additional role behavior, but they must integrate into shared permission systems.

---

# Shared Permission Responsibilities

Shared permission infrastructure owns:

- authentication integration
- authorization primitives
- Circle membership validation
- role validation
- permission evaluation
- scoped access coordination
- protected action enforcement
- authorization-aware realtime access

---

# Authorization Hierarchy

Typical hierarchy:

Authenticated User
→ Circle Membership
→ Circle Role
→ Module Access
→ Session Participation
→ Tool/Engine Behavior

---

# Circle Permissions

Circle permissions remain foundational.

Examples:
- owner
- admin
- member

Circle permissions determine:
- module availability
- session creation rights
- moderation capabilities
- membership management rights

Modules must not bypass Circle permissions.

---

# Module Permissions

Modules may define:
- module-specific roles
- workflow permissions
- gameplay permissions

Examples:
- Game Night Host
- Grocery Editor
- Planning Moderator

Module permissions should extend platform permissions rather than replace them.

---

# Session Permissions

Shared infrastructure owns:
- participant authorization
- session access validation
- reconnect authorization
- session-scoped visibility

Modules define:
- gameplay meaning
- participant responsibilities
- role-specific actions

---

# Realtime Authorization

Realtime systems must validate:
- subscription access
- session membership
- Circle visibility
- event authorization

Unauthorized clients must not receive protected realtime data.

---

# Shared Device Considerations

Permission systems should support:
- local multiplayer
- guest participation patterns
- low-friction participation

Guest access should remain:
- scoped
- temporary when appropriate
- privacy-safe

---

# Permission Evaluation Principles

Permission checks should remain:
- deterministic
- centralized
- predictable
- reusable

Avoid:
- duplicated authorization logic
- hidden permission behavior
- module-specific security hacks

---

# Accessibility

Permission-related messaging should remain:
- readable
- understandable
- actionable

Permission failures should not confuse users unnecessarily.

---

# Security Principles

Authorization systems must:
- validate backend-side
- respect Circle boundaries
- protect session privacy
- prevent unauthorized escalation

Frontend checks improve UX but are not authoritative security.

---

# Performance Principles

Permission systems should:
- avoid redundant checks
- support scalable realtime workflows
- remain lightweight during session activity

---

# Design Principles

- centralized authorization behavior
- Circle-aware security boundaries
- reusable permission primitives
- predictable access control
- module-independent authorization infrastructure

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
