# System Ownership Map

## Overview

This document defines where major responsibilities belong inside Inner Circle.

Its purpose is to prevent architectural drift, duplicated systems, and unclear ownership.

---

## Core Principle

Each responsibility should have one clear owner.

If a system is useful across multiple modules, it belongs at the platform or shared infrastructure level.

If a behavior is specific to one module or tool, it belongs there.

---

# Ownership Layers

## 1. Platform Layer

The platform owns systems that apply across the entire app.

Platform-owned responsibilities:

- authentication
- user identity
- Circle creation
- Circle membership
- Circle switching
- permissions and roles
- module registration
- module availability
- app-wide settings
- platform-level privacy rules

The platform must NOT contain module-specific business logic.

---

## 2. Shared Infrastructure Layer

Shared infrastructure owns reusable technical systems that multiple modules may use.

Shared infrastructure responsibilities:

- notification delivery
- invitation framework
- realtime transport
- reconnect recovery patterns
- timer primitives
- participant presence
- validation helpers
- shared UI components
- dialogs
- cards
- buttons
- accessibility primitives
- logging
- diagnostics
- audio and feedback primitives

Shared infrastructure should be generic.

It should not know specific Game Hat rules, grocery rules, chore rules, or module-specific workflows.

---

## 3. Module Layer

Modules are major feature areas inside a Circle.

Examples:
- Family Toolbox
- Game Night
- Recipes
- Planning

Modules own:
- module-specific navigation
- module-specific workflows
- module-specific screens
- module-specific settings
- module-specific data models
- module-specific state

Modules may use platform and shared infrastructure services.

Modules must not reimplement platform systems.

---

## 4. Tool / Engine Layer

Tools and engines are specialized systems inside modules.

Example:
- Game Hat inside Game Night

Tools and engines own:
- domain-specific rules
- state machines
- runtime behavior
- scoring logic
- prompt logic
- gameplay-specific configuration
- tool-specific edge cases

Tools should remain isolated from unrelated modules.

---

# Specific Ownership Decisions

## Authentication

Owner:
- Platform Layer

Modules must never manage authentication directly.

---

## Circles

Owner:
- Platform Layer

Modules operate inside active Circle context.

Modules must not create their own group systems.

---

## Invitations

Owner:
- Shared Infrastructure Layer

Canonical document:
- docs/shared-invitations.md

Modules and tools may request invitations, but they must not implement their own invitation lifecycle or delivery systems.

Examples:
- Game Night may request session invitations.
- Game Hat may rely on Game Night/session invitations.
- Circle invitations are handled through the shared invitation framework.

Shared Invitations owns:
- invitation creation
- invitation status tracking
- acceptance and decline handling
- expiration behavior
- delivery coordination
- notification integration points

---

## Notifications

Owner:
- Shared Infrastructure Layer

Modules may emit notification events, but notification delivery and presentation rules are shared.

---

## Permissions

Owner:
- Platform Layer

Modules may define module-specific permission requirements, but permission evaluation should be performed through shared permission infrastructure.

Platform owns:
- permission policy
- Circle roles
- authorization semantics

Shared Infrastructure owns:
- reusable permission evaluation helpers

---

## Sessions

Owner:
- Shared Infrastructure Layer + Module Layer

Shared infrastructure owns the generic session lifecycle pattern.

Modules define their session-specific behavior.

Example:
- Game Night uses shared sessions.
- Game Hat defines gameplay behavior inside a Game Night session.

---

## Timers

Owner:
- Shared Infrastructure Layer

Timer primitives should be reusable.

Game Hat owns how timers affect gameplay.

---

## Realtime

Owner:
- Shared Infrastructure Layer

Realtime transport and reconnect patterns are shared.

Modules define what their realtime events mean.

---

## Accessibility

Owner:
- Shared Infrastructure Layer

Accessibility standards and reusable primitives are shared.

Modules may define module-specific accessibility needs.

---

## Shared UI

Owner:
- Shared Infrastructure Layer

Reusable UI components should be shared.

Modules may compose shared components into module-specific screens.

---

## Game Night

Owner:
- Module Layer

Game Night owns:
- social play module entry
- game session orchestration
- lobby flow
- participant coordination
- launching tools such as Game Hat

Game Night does not own authentication, permissions, invitations, or notifications.

---

## Game Hat

Owner:
- Tool / Engine Layer

Game Hat owns:
- prompt submission rules
- prompt assignment rules
- Active Player rules
- scoring and rotation
- gameplay state machine
- mode-specific behavior for Act It Out and Draw It

Game Hat uses shared systems for:
- timers
- realtime transport
- invitations
- notifications
- accessibility primitives
- shared UI components

---

# Dependency Rules

Allowed dependency direction:

```text
App
→ Platform
→ Shared Infrastructure
→ Modules
→ Module-Owned Tools / Engines
```

General guidance:

- App may depend on Platform.
- Platform may depend on Shared Infrastructure.
- Modules may depend on Platform and Shared Infrastructure.
- Tools and Engines may depend on Modules, Platform, and Shared Infrastructure.
- Shared Infrastructure must not depend on Modules or Tools.
- Platform must not depend on Module-specific business logic.

---

# Promotion Rule

If the same behavior is needed by more than one module, consider promoting it upward.

Promotion path:

Tool-specific behavior
→ Module-level behavior
→ Shared Infrastructure
→ Platform-level behavior

Promotion should be intentional, not automatic.

---

# Anti-Patterns

Avoid:

- duplicating invitation systems inside modules
- duplicating notification systems inside modules
- putting game rules in platform code
- putting Circle management inside modules
- building one-off UI components when shared components exist
- allowing modules to bypass permissions
- allowing local UI state to become authoritative shared state

---

# Design Principle

Build with the intended long-term ownership model in mind.

Do not create temporary architecture that is expected to be replaced later.

If ownership is unclear, update this document before implementing.
