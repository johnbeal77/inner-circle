# Game Night Session Flow

## Overview

This document defines the high-level flow for Game Night sessions.

Game Night is responsible for:
- organizing players
- managing invitations
- configuring sessions
- launching game tools such as Game Hat

Game-specific gameplay rules belong to the individual game tool.

---

## Session Creation Flow

1. User enters a Circle
2. User opens Game Night
3. User selects:
   - game tool
   - session settings
4. User becomes Host
5. Session enters created state

---

## Player Invitation Flow

Host selects Circle members to invite.

Invitees may:
- accept
- decline
- ignore invitation

Accepted users become Players in the session.

---

## Lobby Flow

After invitations:

Session enters waiting/lobby state.

Lobby responsibilities:
- display joined Players
- display pending invites
- configure settings
- prepare game requirements

---

## Game Hat Preparation Flow

For Game Hat:

1. Host configures prompts-per-player
2. Players submit prompts
3. Prompt completion is tracked
4. Session cannot begin until requirements are satisfied (unless Host overrides)

---

## Session Start Flow

Host starts session.

Game Night:
- locks setup state
- launches selected game tool
- transitions session into active state

---

## Active Session Flow

During active play:

Game Night manages:
- participant presence
- reconnect behavior
- session visibility
- high-level session state

Game-specific tools manage:
- gameplay rules
- scoring
- prompts
- timers
- turn logic

---

## Session Completion Flow

When gameplay ends:

Session enters completed state.

Possible future actions:
- rematch
- replay
- return to lobby
- session history
- statistics

---

## Cancellation Flow

Host may cancel session before completion.

Cancelled sessions:
- stop realtime updates
- notify Players
- preserve or discard state depending on module rules

---

## Disconnect Handling

If Players disconnect:
- session should attempt recovery
- temporary disconnects should not immediately end the session

Host disconnect behavior may vary by module.

---

## Design Principles

- Game Night manages orchestration
- game tools manage gameplay
- setup should remain lightweight
- Players should understand session state clearly
- reconnect behavior should be predictable

---

## Summary

Game Night provides the shared multiplayer session framework used by social game tools inside Inner Circle.
