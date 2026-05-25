# Game Hat Lobby

## Overview

The Game Hat lobby is the preparation and coordination space before gameplay begins.

The lobby should feel:
- socially welcoming
- easy to understand
- low friction
- clearly organized

---

## Core Principle

The lobby exists to prepare Players for gameplay without overwhelming them.

Players should always understand:
- who is present
- what still needs to happen
- whether the session is ready to begin

---

## Lobby Responsibilities

The lobby manages:
- player presence
- session configuration visibility
- prompt submission progress
- session readiness
- gameplay start transition

Invitation lifecycle behavior is owned by:
- docs/shared-invitations.md

---

## Player Visibility

The lobby should clearly display:
- joined Players
- pending invites
- disconnected Players
- Host identity
- current Active Player if applicable

---

## Prompt Progress Visibility

Players should understand:
- prompts submitted
- prompts remaining
- which Players are finished

Visibility should avoid exposing actual prompt text.

---

## Session Configuration Visibility

Players should be able to view:
- selected mode
- timer settings
- scoring rules
- rotation rules
- prompts-per-player requirement

---

## Ready State

The lobby should clearly communicate whether the session is:

- waiting for Players
- waiting for prompts
- ready to begin

---

## Host Controls

The Host may:
- request player invitations
- remove Players from the session
- adjust configuration
- start session
- cancel session

Invitation infrastructure is owned by:
- docs/shared-invitations.md

Game Hat and Game Night may request invitation behavior, but they do not own invitation lifecycle or delivery systems.

Possible future options:
- lock settings
- force start
- transfer Host role

---

## Shared Device Considerations

Shared-device flows should support:
- easy Player handoff
- quick status checking
- minimal navigation complexity

---

## Reconnect Handling

Disconnected Players should:
- remain visible temporarily
- restore lobby state after reconnect
- avoid duplicating participant entries

---

## Transition Into Gameplay

When gameplay begins:
- lobby state locks
- session transitions into gameplay state
- Players receive synchronized transition into first round

---

## Visual Philosophy

The lobby should feel:
- welcoming
- socially active
- lightweight
- readable at a glance

Avoid:
- overly technical displays
- cluttered menus
- excessive setup friction

---

## Design Principles

- clarity over complexity
- visible session readiness
- socially comfortable coordination
- lightweight multiplayer preparation
