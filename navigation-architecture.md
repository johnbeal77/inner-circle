# Navigation Architecture

## Overview

Inner Circle uses a modular navigation structure centered around Circles and modules.

Navigation should remain:
- simple
- scalable
- consistent across modules

---

# Primary Navigation Philosophy

The platform flow is:

Authentication
-> Circle Selection
-> Module Selection
-> Module Experience

---

# Navigation Layers

## 1. Platform Navigation

Platform-level navigation handles:
- authentication
- Circle management
- profile/settings
- notifications

This layer exists outside individual modules.

---

## 2. Circle Navigation

After selecting a Circle, users access:
- enabled modules
- Circle-specific activity
- shared content

The active Circle becomes the context for all module interactions.

---

## 3. Module Navigation

Each module manages its own internal navigation.

Examples:
- Family Toolbox screens
- Game Night screens

Modules should remain isolated whenever possible.

---

# Planned Navigation Structure

App Launch
  -> Authentication
  -> Circle Selector
  -> Circle Home
      -> Module Entry
          -> Module Screens

---

# Circle Home

The Circle Home screen acts as the central hub for a Circle.

It may contain:
- enabled modules
- recent activity
- shared notifications
- active sessions

---

# Module Entry Principle

Modules should behave like self-contained apps operating inside a Circle.

Modules should:
- manage their own workflows
- avoid depending on other modules directly

---

# Shared Navigation Components

Reusable navigation elements may include:
- top app bars
- Circle switcher
- module launcher
- notification center

---

# Design Goals

- keep navigation intuitive
- maintain modular separation
- reduce cross-module coupling
- support future expansion cleanly
