# Game Hat Reconnect Behavior

## Overview

This document defines how Game Hat handles disconnects, reconnects, and temporary connection instability.

The goal is to preserve session continuity whenever possible.

---

## Core Principle

The session state is authoritative.

Clients should restore state from the backend after reconnecting.

Clients should never assume their local state is authoritative after disconnect.

---

## Temporary Disconnects

If a Player disconnects temporarily:

- session should continue when possible
- Player should attempt automatic reconnection
- Player should restore current session state after reconnect

---

## Reconnect Flow

When reconnecting:

1. Client reconnects to backend
2. Client validates session membership
3. Client requests current authoritative session state
4. Client restores:
   - session state
   - participant state
   - timer state
   - scores
   - current Active Player

---

## Active Player Disconnect

If the Active Player disconnects:

Preferred MVP behavior:
- pause session temporarily
- allow reconnect grace period

If reconnect fails:
- Host may:
  - skip round
  - assign next Active Player
  - cancel session

---

## Host Disconnect

If the Host disconnects:

Preferred MVP behavior:
- session remains active temporarily
- Host reconnect allowed

Future options:
- transfer Host role
- automatic fallback Host

---

## Timer Behavior During Disconnect

Timers should remain authoritative on backend/shared state.

Local device timers should not become authoritative.

Reconnect should restore:
- current timer value
- remaining round time

---

## Duplicate Session Protection

Reconnect behavior should prevent:
- duplicate participant entries
- duplicated events
- repeated scoring actions
- multiple Active Players

---

## Session Recovery Principles

Recovery should prioritize:
- preserving session continuity
- avoiding unfair round outcomes
- minimizing disruption to Players

---

## Design Principles

- backend state is authoritative
- reconnect should feel predictable
- disconnects should not corrupt session state
- Players should recover gracefully whenever possible
