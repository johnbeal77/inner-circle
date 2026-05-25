# Shared Navigation

## Overview

Inner Circle uses shared navigation infrastructure to provide consistent movement through:
- platform systems
- Circles
- modules
- sessions
- tools/engines

Navigation systems should remain reusable and predictable across the platform.

---

## Core Principle

Navigation structure belongs to shared infrastructure and platform architecture rather than individual modules.

Modules and tools may define internal routes and flows, but they should integrate into shared navigation patterns.

---

# Shared Navigation Responsibilities

Shared navigation infrastructure owns:

- top-level navigation structure
- Circle switching behavior
- session entry/exit behavior
- navigation coordination patterns
- route registration patterns
- deep linking foundations
- shared navigation transitions
- back navigation expectations

---

# Navigation Hierarchy

Typical hierarchy:

Platform
→ Circle
→ Module
→ Session
→ Tool/Engine Flow

Example:

Inner Circle
→ Game Night
→ Game Hat Session
→ Active Round

---

# Circle-Aware Navigation

Navigation should remain Circle-aware.

The active Circle determines:
- visible modules
- available sessions
- accessible data
- scoped notifications
- realtime subscriptions

Switching Circles should update navigation context predictably.

---

# Shared Navigation Principles

Navigation should feel:

- predictable
- lightweight
- readable
- low-friction
- mobile-friendly

Avoid:
- excessive nesting
- confusing back behavior
- hidden navigation state
- deep modal stacking

---

# Session Navigation

Shared infrastructure owns:
- session entry patterns
- session restoration patterns
- reconnect-safe navigation restoration

Modules define:
- gameplay/workflow screen flow
- session-specific transitions

---

# Deep Linking

Possible future support:
- invite links
- session join links
- Circle links
- notification routing

Deep linking infrastructure should remain centralized.

---

# Back Navigation Principles

Back navigation should remain predictable.

Examples:
- leaving a tool returns to module context
- leaving a session returns to module lobby
- Circle context should remain preserved when appropriate

Avoid:
- unexpected app exits
- losing active session context
- destructive navigation surprises

---

# Shared Device Considerations

Navigation systems should support:
- fast handoff between Players
- reconnect-safe restoration
- minimal navigation complexity during social interaction

---

# Accessibility

Navigation systems should support:
- readable hierarchy
- clear screen transitions
- accessible back behavior
- predictable focus movement

---

# Realtime Integration

Realtime systems may affect navigation behavior:

Examples:
- session started
- reconnect restoration
- invite acceptance
- session completion

Realtime-triggered navigation should remain controlled and predictable.

---

# Performance Principles

Navigation systems should:
- remain lightweight
- avoid unnecessary rebuilds
- preserve important state appropriately

---

# Design Principles

- reusable navigation infrastructure
- predictable hierarchy
- Circle-aware routing
- reconnect-safe restoration
- module-independent navigation coordination

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
