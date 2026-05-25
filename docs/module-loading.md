# Module Loading

## Overview

Inner Circle is a modular platform.

Modules are feature systems that operate inside a Circle.

Examples:
- Family Toolbox
- Game Night
- Recipes
- Planning

---

## Core Principle

The platform owns:
- authentication
- Circle context
- permissions
- navigation shell

Modules own:
- internal screens
- workflows
- module-specific state
- module-specific data

---

## Enabled Modules

Each Circle may have enabled modules.

Examples:
- family_toolbox
- game_night

A module should only appear in a Circle if it is enabled for that Circle.

---

## Module Entry Points

Each module should expose a clear entry point.

Example:

Game Night entry point:
- title
- icon
- route
- required permissions

---

## Module Isolation

Modules should not directly depend on each other.

If modules need shared behavior, that behavior should move into the shared/core platform layer.

---

## Shared Platform Services

Modules may use:
- active Circle context
- authenticated user
- permissions
- shared UI components
- notifications
- realtime services

---

## Design Rules

- Do not hardcode module behavior into platform screens
- Do not let modules manage Circle membership
- Do not duplicate shared infrastructure inside modules
- Keep module registration explicit and predictable

---

## Summary

Module loading allows Inner Circle to grow without turning into a tangled feature pile.
