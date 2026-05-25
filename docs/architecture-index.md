# Architecture Index

## Overview

This document defines the primary architectural structure of Inner Circle.

Its purpose is to:
- organize architectural documentation
- identify canonical references
- reduce conceptual duplication
- provide onboarding guidance
- stabilize long-term architecture navigation

This document acts as the primary entry point into the architecture documentation system.

---

# Architecture Philosophy

Inner Circle follows:
- ownership-first architecture
- reusable infrastructure
- deterministic systems
- reconnect-safe design
- modular organization
- documentation-driven development

Canonical philosophy reference:
- docs/shared-architecture-principles.md

---

# Reading Order

Recommended architecture reading order:

1. Shared Architecture Principles
2. System Ownership Map
3. Shared Domain Modeling
4. Shared Event Architecture
5. Shared Lifecycle Architecture
6. Shared Synchronization Principles
7. Shared State Management
8. Shared Sessions
9. Shared Realtime
10. Shared Permissions
11. Shared UI
12. Module and Tool Documentation

---

# Canonical Architecture Documents

## Foundational Architecture

### Shared Architecture Principles
File:
- docs/shared-architecture-principles.md

Defines:
- core platform philosophy
- architectural priorities
- long-term design principles

---

### System Ownership Map
File:
- docs/system-ownership-map.md

Defines:
- ownership boundaries
- layer responsibilities
- dependency direction

---

### Shared Domain Modeling
File:
- docs/shared-domain-modeling.md

Defines:
- canonical entity structure
- conceptual ownership
- relationship modeling

---

### Shared Event Architecture
File:
- docs/shared-event-architecture.md

Defines:
- event semantics
- event ownership
- synchronization event principles

---

### Shared Lifecycle Architecture
File:
- docs/shared-lifecycle-architecture.md

Defines:
- lifecycle transitions
- expiration principles
- recovery expectations

---

### Shared Synchronization Principles
File:
- docs/shared-synchronization-principles.md

Defines:
- authoritative state philosophy
- reconciliation behavior
- reconnect-safe synchronization

---

# Shared Infrastructure Documents

## Shared Sessions
File:
- docs/shared-sessions.md

Defines:
- reusable session primitives
- participant coordination
- reconnect-safe session behavior

---

## Shared Realtime
File:
- docs/shared-realtime.md

Defines:
- realtime transport expectations
- reconnect coordination
- synchronization infrastructure

---

## Shared Timers
File:
- docs/shared-timers.md

Defines:
- authoritative timer behavior
- synchronization timing
- reconnect-safe timer coordination

---

## Shared Notifications
File:
- docs/shared-notifications.md

Defines:
- notification infrastructure
- delivery coordination
- scoped notification behavior

---

## Shared Invitations
File:
- docs/shared-invitations.md

Defines:
- invitation lifecycle
- invitation coordination
- participation onboarding behavior

---

## Shared Permissions
File:
- docs/shared-permissions.md

Defines:
- authorization structure
- Circle-aware permissions
- scoped access control

---

## Shared State Management
File:
- docs/shared-state-management.md

Defines:
- authoritative state ownership
- state layering
- reconciliation expectations

---

## Shared Validation
File:
- docs/shared-validation.md

Defines:
- reusable validation primitives
- validation consistency
- authoritative validation philosophy

---

## Shared Error Handling
File:
- docs/shared-error-handling.md

Defines:
- recovery expectations
- shared error coordination
- reconnect-safe error behavior

---

## Shared UI
File:
- docs/shared-ui.md

Defines:
- reusable UI systems
- interaction consistency
- accessibility-aware UI expectations

---

## Shared Accessibility
File:
- docs/shared-accessibility.md

Defines:
- platform accessibility philosophy
- reusable accessibility primitives
- interaction readability standards

---

## Shared Navigation
File:
- docs/shared-navigation.md

Defines:
- routing hierarchy
- Circle-aware navigation
- reconnect-safe navigation restoration

---

## Shared Audio and Feedback
File:
- docs/shared-audio-and-feedback.md

Defines:
- reusable feedback primitives
- synchronized interaction cues
- accessibility-aware feedback behavior

---

## Shared Data Persistence
File:
- docs/shared-data-persistence.md

Defines:
- persistence ownership
- retention behavior
- archival expectations

---

## Shared Identity and Presence
File:
- docs/shared-identity-and-presence.md

Defines:
- participant visibility
- reconnect identity restoration
- scoped presence behavior

---

## Shared Configuration
File:
- docs/shared-configuration.md

Defines:
- configuration ownership
- feature flag coordination
- scoped configuration behavior

---

## Shared Logging and Diagnostics
File:
- docs/shared-logging-and-diagnostics.md

Defines:
- operational visibility
- diagnostics coordination
- reconnect troubleshooting expectations

---

## Shared Analytics and Telemetry
File:
- docs/shared-analytics-and-telemetry.md

Defines:
- telemetry ownership
- analytics coordination
- privacy-aware operational measurement

---

## Shared Testing Strategy
File:
- docs/shared-testing-strategy.md

Defines:
- deterministic testing expectations
- reconnect-safe validation
- infrastructure testing philosophy

---

## Shared Development Workflow
File:
- docs/shared-development-workflow.md

Defines:
- architectural workflow expectations
- AI-assisted development rules
- contribution philosophy

---

## Shared Integration Architecture
File:
- docs/shared-integration-architecture.md

Defines:
- external service boundaries
- provider-independent architecture
- integration ownership expectations

---

# Module Documentation

## Game Night
Folder:
- docs/game-night/

Defines:
- social gameplay coordination
- multiplayer session orchestration
- game module workflows

---

# Tool / Engine Documentation

## Game Hat
Folder:
- docs/game-night/

Defines:
- gameplay rules
- prompt systems
- round behavior
- scoring logic
- multiplayer gameplay flow

---

# Canonical Ownership Rule

If multiple documents appear to overlap:

1. Use the most foundational ownership document
2. Prefer shared infrastructure ownership over duplication
3. Update ownership documentation before implementation

Architecture should remain:
- deterministic
- ownership-aware
- minimally duplicated

---

# Future Expansion Philosophy

New architectural documents should only be added when:
- a genuinely new architectural domain appears
- ownership is unclear
- reusable infrastructure boundaries require clarification

Avoid unnecessary architectural fragmentation.

---

# Design Principles

- architecture-first organization
- canonical ownership references
- deterministic documentation structure
- scalable architectural navigation
- long-term maintainability
