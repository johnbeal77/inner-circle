# Shared Validation

## Overview

Inner Circle uses shared validation infrastructure to provide consistent input and state validation across the platform.

Validation systems should remain reusable across:
- platform systems
- modules
- tools/engines
- realtime workflows
- future collaborative systems

---

## Core Principle

Validation rules should have a single clear owner whenever possible.

Reusable validation behavior belongs in shared infrastructure rather than being independently recreated by modules.

---

# Shared Validation Responsibilities

Shared validation infrastructure owns:

- reusable validation primitives
- common validation patterns
- validation result structures
- validation messaging standards
- shared formatting rules
- validation coordination patterns

Modules and tools define:
- domain-specific validation rules
- gameplay/workflow meaning
- module-specific constraints

---

# Validation Categories

Examples:

- required field validation
- length validation
- format validation
- permission validation
- session participation validation
- realtime state transition validation
- duplicate detection
- configuration validation

---

# Frontend and Backend Consistency

Validation behavior should remain consistent across:
- frontend UI
- backend services
- realtime systems

Frontend validation improves usability.

Backend validation remains authoritative.

---

# Validation Result Principles

Validation results should remain:
- readable
- predictable
- actionable
- consistent across modules

Avoid:
- vague error messaging
- technical jargon in user-facing validation
- inconsistent validation behavior

---

# Shared Validation Examples

Examples of reusable validation primitives:

- non-empty text
- maximum length
- allowed character sets
- numeric range validation
- timestamp validation
- UUID validation
- role/permission checks

---

# Realtime Validation

Realtime systems may validate:
- state transitions
- session actions
- reconnect actions
- participant actions

Authoritative validation should occur on shared/backend systems.

---

# Session and Gameplay Validation

Modules and tools may define:
- gameplay legality
- session-specific rules
- scoring validity
- prompt rules

Shared infrastructure should not own gameplay-specific rules.

---

# Shared Device Considerations

Validation systems should support:
- low-friction participation
- readable error feedback
- quick recovery during social interaction

Avoid:
- excessive interruption
- complicated correction flows

---

# Accessibility

Validation systems should support:
- readable messaging
- visual clarity
- accessible error presentation
- non-audio-only feedback

---

# Security Principles

Validation must not rely solely on client behavior.

Backend/shared systems remain authoritative for:
- permissions
- participation
- state transitions
- protected actions

---

# Performance Principles

Validation systems should:
- remain lightweight
- avoid duplicated processing
- support scalable realtime workflows

---

# Design Principles

- reusable validation primitives
- authoritative backend validation
- readable user feedback
- consistent validation behavior
- module-independent infrastructure

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
