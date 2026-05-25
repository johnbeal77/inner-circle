# Flutter Architecture

## Overview

Inner Circle is built as a modular Flutter application.

The application consists of:
- a platform layer
- module layers
- optional engine layers inside modules

The architecture prioritizes:
- modularity
- separation of concerns
- scalability
- reusable shared systems

---

# Architecture Layers

## 1. Platform Layer

The platform layer is responsible for:
- authentication
- Circle management
- permissions
- navigation
- shared infrastructure

This layer should NOT contain module-specific business logic.

---

## 2. Module Layer

Modules are self-contained feature systems.

Examples:
- Family Toolbox
- Game Night

Each module manages:
- its own screens
- workflows
- internal logic
- Circle-scoped data

Modules should be independent whenever possible.

---

## 3. Engine Layer (Optional)

Some modules may contain reusable internal engines.

Example:
- Game Night contains Game Hat

Engines manage:
- rules
- state machines
- runtime gameplay logic

Engines should remain UI-independent whenever possible.

---

# Folder Structure (Planned)

lib/
  core/
  circles/
  modules/
    family_toolbox/
    game_night/
      game_hat/

---

# Shared Infrastructure

The following systems should be reusable across modules:
- authentication
- Circle permissions
- notifications
- timers
- dialogs
- shared UI components

---

# State Management (Planned)

The architecture should support scalable state management.

Preferred direction:
- Riverpod

Reason:
- modularity
- testability
- separation of state from UI

---

# Backend (Planned)

Preferred backend:
- Supabase

Used for:
- authentication
- realtime sync
- shared data
- multiplayer sessions

---

# Design Principles

- Keep modules isolated
- Avoid cross-module dependencies
- Keep engines reusable
- Separate UI from business logic
- Keep shared infrastructure centralized
