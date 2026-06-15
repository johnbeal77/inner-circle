# Shared Permissions and Authorization

## Overview

Inner Circle uses shared permission and authorization infrastructure to manage access across:
- platform systems
- Circles
- modules
- sessions
- tools and engines

Permission systems should remain reusable, predictable, and Circle-aware.

---

## Core Principle

Authorization policy belongs to the Platform Layer.

Permission evaluation infrastructure belongs to Shared Infrastructure.

Modules and tools may define additional role behavior, but they must integrate into the shared permission system and respect platform authorization rules.

---

# Shared Permission Responsibilities

Shared permission infrastructure owns:

- authorization primitives
- permission evaluation helpers
- Circle membership validation helpers
- role validation helpers
- scoped access evaluation
- protected action helpers
- authorization-aware realtime access

Shared infrastructure does not define authorization policy.

Authorization policy belongs to the Platform Layer.

---

# Authorization Hierarchy

Typical hierarchy:

Authenticated User
→ Circle Membership
→ Circle Role
→ Module Access
→ Session Participation
→ Tool and Engine Behavior

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
- participant authorization helpers
- session access validation helpers
- reconnect authorization helpers
- session-scoped visibility helpers

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

Authorization Policy Owner:
- Platform Layer

Shared Permission Infrastructure Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools and Engines
