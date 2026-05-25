# Shared Development Workflow

## Overview

Inner Circle uses a shared development workflow to maintain architectural consistency, development quality, and long-term maintainability across:
- platform systems
- modules
- sessions
- tools/engines
- shared infrastructure

Development workflows should reinforce:
- ownership boundaries
- reusable infrastructure
- deterministic architecture
- maintainable scaling

---

## Core Principle

Development should follow established ownership boundaries rather than introducing temporary or duplicated architecture.

The project should evolve intentionally rather than through uncontrolled feature accumulation.

---

# Shared Workflow Responsibilities

Shared development workflow infrastructure defines:

- architectural expectations
- dependency direction rules
- contribution standards
- documentation expectations
- shared naming conventions
- reusable workflow patterns
- AI-assisted development guidance

---

# Ownership-First Development

Before implementing new behavior:

1. Determine ownership layer
2. Verify existing shared infrastructure
3. Avoid duplicated systems
4. Extend existing architecture when appropriate
5. Update ownership documentation if unclear

Implementation should follow ownership clarity rather than improvisation.

---

# Dependency Direction

Allowed dependency direction:

Platform
→ Shared Infrastructure
→ Modules
→ Tools / Engines

Lower layers may consume higher-level services.

Higher layers must not depend on lower-layer business logic.

---

# Shared Infrastructure Philosophy

Reusable systems should be promoted intentionally.

Promotion path:

Tool-specific behavior
→ Module-shared behavior
→ Shared infrastructure
→ Platform-wide behavior

Avoid:
- premature abstraction
- duplicated infrastructure
- isolated one-off systems

---

# Documentation Expectations

Major architectural behavior should be documented before implementation.

Examples:
- shared infrastructure systems
- realtime coordination behavior
- session lifecycle behavior
- ownership boundaries
- state synchronization rules

Documentation should remain:
- readable
- scoped appropriately
- architecture-focused

---

# AI-Assisted Development

AI-assisted workflows should:
- follow ownership boundaries
- avoid generating duplicate systems
- respect shared infrastructure
- prioritize deterministic architecture

AI-generated code should not invent new infrastructure layers without review.

---

# Shared Naming Conventions

Naming should remain:
- descriptive
- scoped appropriately
- architecture-aware
- reusable when possible

Avoid:
- ambiguous ownership naming
- module-specific names for shared infrastructure
- temporary placeholder architecture names

---

# Refactoring Principles

Refactoring should:
- improve ownership clarity
- reduce duplication
- stabilize architecture
- preserve deterministic behavior

Avoid:
- unnecessary architectural churn
- repeated large-scale restructuring
- unstable ownership boundaries

---

# Shared Testing Expectations

Development workflows should integrate with:
- shared testing strategy
- validation systems
- diagnostics systems
- error handling systems

Major architectural behavior should remain testable.

---

# Accessibility Expectations

Accessibility should remain integrated into standard development workflows.

Accessibility should not become:
- optional
- deferred indefinitely
- isolated from normal design decisions

---

# Security Expectations

Development workflows must respect:
- Circle boundaries
- authorization systems
- realtime security
- session privacy
- scoped data visibility

---

# Shared Device Considerations

Development should consider:
- local multiplayer
- shared-device interaction
- reconnect safety
- low-friction participation

Shared-device support is a platform-level consideration rather than a module afterthought.

---

# Design Principles

- ownership-first architecture
- reusable infrastructure
- deterministic systems
- intentional abstraction
- long-term maintainability

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
