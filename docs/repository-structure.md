# Repository Structure

## Overview

This document defines the intended high-level repository structure for the Inner Circle MVP.

The repository structure should reflect:
- platform ownership
- shared infrastructure boundaries
- modular organization
- reusable systems
- deterministic architecture

---

## Core Principle

Repository structure should mirror architectural ownership.

Folders should communicate:
- ownership
- responsibility
- dependency direction
- system boundaries

Avoid:
- ambiguous structure
- mixed ownership folders
- infrastructure duplication
- unclear module boundaries

---

## High-Level Flutter Structure

```text
lib/
  app/

  platform/
    auth/
    circles/
    modules/
    permissions/

  shared/
    sessions/
    realtime/
    timers/
    participants/
    validation/
    ui/
    diagnostics/

  modules/
    game_night/
      game_hat/
        engine/
        screens/
        data/
        widgets/
```

---

## Ownership Rules

### app/

Application bootstrap and startup configuration.

Examples:
- app initialization
- dependency registration
- routing configuration
- application shell

---

### platform/

Platform-wide systems.

Examples:
- authentication
- Circle management
- permissions
- module registration
- platform services

Platform code must not contain module-specific business logic.

---

### shared/

Reusable infrastructure used by multiple modules.

Examples:
- sessions
- realtime
- timers
- validation
- shared UI
- diagnostics

Shared systems should remain generic.

Shared systems should not contain Game Hat rules, grocery logic, or other module-specific behavior.

---

### modules/

Major feature areas.

Examples:
- Game Night
- Family Toolbox
- Recipes
- Planning

Modules own:
- screens
- workflows
- module-specific state
- module-specific data

Modules may depend on platform and shared infrastructure.

---

### Tools and Engines

Tools and engines live inside their owning modules.

Example:

```text
modules/
  game_night/
    game_hat/
```

Game Hat is owned by Game Night.

Tools should only be promoted into shared infrastructure when multiple modules require the same behavior.

---

## Dependency Direction

Allowed dependency direction:

```text
app
  ↓
platform
  ↓
shared
  ↓
modules
  ↓
tools and engines
```

Lower layers may depend on higher-level services only through approved interfaces.

Ownership should remain clear at all times.

---

## Design Principle

Repository structure should communicate architecture.

A developer should be able to understand ownership boundaries simply by looking at the folder tree.
