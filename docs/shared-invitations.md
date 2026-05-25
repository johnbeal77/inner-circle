# Shared Invitations

## Overview

Inner Circle uses a shared invitation system across the platform.

Invitations are reusable infrastructure used by:
- Circles
- sessions
- modules
- future collaborative systems

The invitation framework should remain generic and reusable.

---

## Core Principle

Invitation delivery and lifecycle management belong to shared infrastructure, not individual modules.

Modules may request invitations, but they should not implement their own invitation systems.

---

# Invitation Types

Examples of invitation categories:

- Circle invitation
- session invitation
- module participation invitation
- future collaboration invitation

---

# Invitation Lifecycle

Typical lifecycle:

1. Invitation created
2. Invitation delivered
3. Recipient:
   - accepts
   - declines
   - ignores
   - invitation expires
4. Related system updates state

---

# Shared Invitation Responsibilities

The shared invitation system owns:

- invitation creation
- invitation status tracking
- invitation delivery
- acceptance/decline handling
- expiration behavior
- notification integration
- invite metadata structure

---

# Invitation States

Common invitation states:

- pending
- accepted
- declined
- expired
- cancelled

---

# Invitation Metadata

Invitations may contain:

- invitation type
- originating Circle
- originating module
- inviter
- recipient
- related session or entity
- creation timestamp
- expiration timestamp

---

# Circle Invitations

Circle invitations allow users to join a Circle.

Acceptance creates or activates Membership.

Circle permissions remain platform-owned.

---

# Session Invitations

Session invitations allow users to participate in temporary shared activities.

Examples:
- Game Night session
- future collaborative sessions

Modules define what participation means after acceptance.

---

# Delivery Methods

Possible delivery methods:

- in-app notifications
- push notifications
- invite links
- QR codes
- future email delivery

Delivery infrastructure should remain reusable.

---

# Shared Device Considerations

Invitation systems should support:
- lightweight onboarding
- temporary participation
- guest-friendly flows where appropriate

---

# Security Principles

Invitations should:
- remain scoped appropriately
- validate recipient permissions
- avoid unauthorized access escalation

Acceptance should never bypass:
- Circle permissions
- membership requirements
- platform authentication rules

---

# Expiration Behavior

Invitations may expire automatically.

Expiration rules may vary by invitation type.

Examples:
- session invite expires after session ends
- Circle invite expires after configurable period

---

# Notification Integration

Invitation systems should integrate with the shared notification infrastructure.

Invitation systems should not directly own notification delivery behavior.

---

# Design Principles

- reusable infrastructure
- lightweight invitation flows
- low-friction participation
- secure acceptance handling
- module-independent architecture

---

# Ownership

Owner:
- Shared Infrastructure Layer

Used by:
- Platform Layer
- Modules
- Tools / Engines
