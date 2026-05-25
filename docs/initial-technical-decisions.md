# Initial Technical Decisions

## Overview

This document defines the initial implementation technology decisions for the Inner Circle MVP.

Its purpose is to:
- stabilize implementation direction
- reduce early technical ambiguity
- align infrastructure choices with architecture
- support scalable development
- preserve long-term maintainability

These decisions may evolve intentionally over time, but foundational architectural principles should remain stable.

---

# Core Philosophy

Technology choices should support:
- reconnect-safe realtime collaboration
- reusable infrastructure
- mobile-first interaction
- scalable modular architecture
- maintainable long-term development

Technology should serve architecture rather than define it.

---

# Frontend Framework

## Flutter

Initial frontend framework:
- Flutter

Reasons:
- strong cross-platform support
- mobile-first development
- consistent UI behavior
- shared component architecture
- strong realtime UI capabilities
- future tablet and desktop support

Primary targets:
- iOS
- Android

Possible future targets:
- web
- desktop platforms

---

# Backend Platform

## Supabase

Initial backend infrastructure:
- Supabase

Planned usage:
- authentication
- PostgreSQL database
- realtime transport
- storage
- edge/server functions

Important principle:
- Supabase is infrastructure, not architecture

Inner Circle retains ownership of:
- domain semantics
- lifecycle behavior
- authorization meaning
- synchronization behavior

---

# Database

## PostgreSQL

Initial persistence layer:
- PostgreSQL via Supabase

Reasons:
- relational consistency
- strong realtime compatibility
- structured ownership modeling
- scalable querying
- mature ecosystem

Primary expected data categories:
- users
- Circles
- memberships
- sessions
- invitations
- notifications
- gameplay state
- prompts
- scores

---

# Authentication

Initial authentication provider:
- Supabase Auth

Possible future support:
- email login
- OAuth providers
- guest participation flows

Authentication infrastructure should remain:
- provider-independent when reasonably possible
- scoped through shared permissions architecture

---

# Realtime Infrastructure

Initial realtime transport:
- Supabase Realtime

Used for:
- session synchronization
- participant presence
- gameplay events
- timer coordination
- reconnect restoration

Important principle:
- realtime transport does not own domain semantics

---

# State Management

Initial frontend state management:
- TBD during implementation spike

Candidate approaches:
- Riverpod
- Bloc
- Provider

Selection criteria:
- deterministic state flow
- reconnect-safe synchronization
- scalable modular architecture
- testability
- readability

State management must align with:
- shared-state-management.md
- shared-synchronization-principles.md

---

# Navigation

Initial navigation approach:
- Flutter routing system with centralized navigation coordination

Requirements:
- Circle-aware navigation
- reconnect-safe restoration
- modular route structure
- deep-link compatibility

Navigation implementation must align with:
- shared-navigation.md

---

# UI System

Initial UI philosophy:
- shared reusable components
- mobile-first interaction
- accessibility-aware design
- lightweight social UX

Planned shared component categories:
- buttons
- dialogs
- cards
- participant lists
- timers
- notifications
- score displays

UI implementation must align with:
- shared-ui.md
- shared-accessibility.md

---

# Session Architecture

Initial session implementation:
- shared session primitives
- authoritative backend synchronization
- reconnect-safe restoration
- scoped realtime coordination

Session implementation must align with:
- shared-sessions.md
- shared-synchronization-principles.md

---

# Synchronization Model

Initial synchronization philosophy:
- authoritative backend/shared state
- client reconciliation
- reconnect-safe restoration
- deterministic event flow

Clients should:
- react to authoritative state
- avoid independent shared truth

Synchronization implementation must align with:
- shared-synchronization-principles.md
- shared-event-architecture.md

---

# Testing Strategy

Initial testing priorities:
- deterministic logic validation
- reconnect testing
- synchronization testing
- multiplayer session testing
- accessibility-aware interaction testing

Testing implementation must align with:
- shared-testing-strategy.md

---

# Logging and Diagnostics

Initial diagnostics priorities:
- reconnect visibility
- synchronization troubleshooting
- error visibility
- session diagnostics

Diagnostics implementation must align with:
- shared-logging-and-diagnostics.md

---

# AI-Assisted Development

AI-assisted workflows may support:
- scaffolding
- documentation alignment
- boilerplate reduction
- implementation acceleration

AI-generated implementation must:
- follow ownership boundaries
- reuse shared infrastructure
- preserve deterministic synchronization
- respect canonical terminology

AI should assist architecture rather than override it.

---

# MVP Technical Priorities

Highest implementation priorities:

1. stable authentication
2. Circle management
3. shared sessions
4. reconnect-safe realtime synchronization
5. Game Night orchestration
6. Game Hat gameplay loop
7. synchronized timers
8. reconnect-safe multiplayer recovery

---

# Deferred Technical Decisions

Decisions intentionally deferred until implementation spikes:

- final frontend state library
- advanced caching strategy
- offline-first support
- advanced analytics stack
- push notification provider
- CI/CD pipeline details
- infrastructure scaling strategy
- advanced monitoring stack

Deferred decisions should follow established architecture principles.

---

# Final Principle

Implementation technology may evolve.

Foundational architecture should remain stable.

Technology choices should reinforce:
- ownership clarity
- reusable infrastructure
- reconnect-safe collaboration
- deterministic systems
- long-term maintainability
