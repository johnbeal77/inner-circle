# Flutter Architecture

## Overview

Inner Circle is built as a modular Flutter application.

The application consists of:
- an application layer
- a platform layer
- shared infrastructure
- module layers
- optional module-owned tools and engines

The architecture prioritizes:
- modularity
- separation of concerns
- scalability
- reusable shared systems
- deterministic behavior
- reconnect-safe collaboration

---

# Architecture Layers

## 1. App Layer

The app layer is responsible for:
- application bootstrap
- theme initialization
- root routing
- environment configuration

The app layer should remain lightweight.

---

## 2. Platform Layer

The platform layer is responsible for:
- authentication
- user profiles
- Circle management
- memberships
- permissions policy
- module registry
- active Circle context

This layer should NOT contain module-specific business logic.

---

## 3. Shared Infrastructure

Shared infrastructure provides reusable systems used by multiple modules.

Examples:
- sessions
- realtime synchronization
- timers
- participant presence
- validation
- diagnostics
- shared UI
- accessibility

Shared infrastructure should remain module-independent.

---

## 4. Module Layer

Modules are self-contained feature systems.

Initial modules:
- Game Night

Future modules may include:
- Family Toolbox
- Recipes
- Planning

Each module manages:
- screens
- workflows
- module-specific state
- Circle-scoped data
- module coordination

Modules should remain independent whenever possible.

---

## 5. Module-Owned Tools and Engines

Modules may contain tools or engines.

Example:

Game Night
- Game Hat

Tools and engines manage:
- rules
- state machines
- gameplay behavior
- tool-specific workflows

Tools should remain owned by their parent module unless reuse outside the module is intentionally approved.

Game Hat should remain a Game Night-owned tool.

---

# Folder Structure

```text
lib/
  app/
  platform/
  shared/
  modules/
    game_night/
      game_hat/
```

Tests should mirror the same ownership structure.

---

# Shared Infrastructure

Reusable infrastructure includes:
- authentication integration
- session lifecycle
- realtime synchronization
- participant presence
- timers
- validation
- diagnostics
- shared UI
- accessibility

Infrastructure should not contain Game Hat-specific logic.

---

# State Management

Initial state management:
- Riverpod

Reasons:
- modular architecture support
- testability
- provider-based composition
- separation of state from UI
- suitability for realtime and reconnect-safe coordination

State management must align with:
- shared-state-management.md
- shared-synchronization-principles.md

---

# Backend

Initial backend:
- Supabase

Used for:
- authentication
- database persistence
- realtime synchronization
- multiplayer sessions
- storage

Important principle:

Supabase provides infrastructure.

Inner Circle owns:
- business rules
- permissions meaning
- lifecycle behavior
- synchronization semantics

---

# Design Principles

- Keep modules isolated
- Avoid cross-module dependencies
- Keep tools owned by modules
- Keep engines reusable where appropriate
- Separate UI from business logic
- Keep shared infrastructure centralized
- Favor deterministic systems
- Favor reconnect-safe collaboration
- Preserve clear ownership boundaries
