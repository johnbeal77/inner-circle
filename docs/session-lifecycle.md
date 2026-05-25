# Session Lifecycle

## Overview

A Session is a temporary live activity inside a Circle.

Sessions are used for realtime or semi-realtime module experiences.

Examples:
- Game Night session
- future collaborative planning session
- future shared activity session

---

## Core Principle

Sessions belong to Circles.

A Session must always have:
- Circle context
- module context
- participants
- state

---

## Session Creation

A Session is created by a user inside an active Circle.

The creator may become:
- session host
- session owner
- session moderator

depending on the module.

---

## Session Types

Sessions may belong to different modules.

Examples:
- game_night
- family_toolbox
- planning

Each module may define its own session-specific behavior.

---

## Session States

Common session states:

- created
- inviting
- waiting
- active
- paused
- completed
- cancelled
- expired

---

## Participants

Participants are users or guests involved in a Session.

Invitation lifecycle behavior is owned by:
- docs/shared-invitations.md

Sessions consume invitation outcomes rather than implementing invitation infrastructure directly.

Participant status may include:
- invited
- accepted
- declined
- active
- disconnected
- removed

---

## Session Flow

General flow:

1. Session is created
2. Participants are invited
3. Shared invitation system processes accept/decline behavior
4. Session enters waiting/lobby state
5. Host starts session
6. Session becomes active
7. Session completes, pauses, or cancels

---

## Host Role

The Host controls session setup.

Host responsibilities may include:
- inviting participants
- configuring session settings
- starting session
- cancelling session
- resolving setup issues

Modules may define additional host powers.

---

## Realtime Behavior

Active sessions may use realtime synchronization for:
- participant state
- timers
- scoring
- shared updates
- state transitions

---

## Session Expiration

Inactive sessions may expire.

Expiration prevents abandoned sessions from remaining active forever.

Possible future rules:
- expire after inactivity
- expire after completion
- archive completed session history

---

## Design Principles

- Sessions should be temporary
- Sessions must remain Circle-scoped
- State transitions should be explicit
- Hosts manage setup, not platform ownership
- Modules define session-specific behavior

---

## Summary

The Session lifecycle defines how temporary collaborative activities are created, joined, run, and completed inside Circles.
