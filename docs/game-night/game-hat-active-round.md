# Game Hat Active Round

## Overview

The active round is the core gameplay state of Game Hat.

During this phase:
- one Active Player performs a prompt
- other Players attempt to guess
- timer and scoring systems operate in realtime

The experience should feel:
- socially engaging
- fast-moving
- readable
- synchronized

---

## Core Principle

Players should always understand:
- whose turn it is
- what phase the round is in
- whether the timer is active
- what action is expected next

---

## Round Start Flow

1. Prompt assigned to Active Player
2. Prompt revealed privately
3. Active Player prepares
4. Timer begins (if enabled)
5. Guessing phase starts

---

## Active Player Responsibilities

The Active Player:
- views the prompt
- performs or draws the prompt
- avoids directly revealing the answer
- selects winning Player
- may control round completion flow

---

## Player Responsibilities

Other Players:
- observe performance/drawing
- attempt guesses
- wait for round outcome

---

## Prompt Privacy

During active rounds:
- only Active Player sees prompt text
- non-active Players should not accidentally view prompt
- shared-device play should support quick handoff/privacy

---

## Timer Visibility

If enabled:
- all Players see synchronized countdown
- warning indicators appear near expiration
- timer expiration is authoritative

---

## Round States

Possible sub-states during active round:

- preparing
- countdown_active
- guessing
- paused
- timeout
- winner_selection
- round_complete

---

## Winner Selection

The Active Player selects:
- winning Player
- or no winner

Selection should remain simple and fast.

---

## Round Completion

After completion:
- scores update
- prompt becomes used
- next Active Player determined
- transition into scoring or next round

---

## Disconnect Handling

If important participants disconnect:
- session may pause temporarily
- reconnect recovery should preserve round state

---

## Shared Device Considerations

Shared-device play should support:
- quick device passing
- hidden prompt reveal
- simple transition between Players

---

## UI Philosophy

The active round screen should prioritize:
- readability
- large timer visibility
- clear Active Player identification
- minimal distractions

Avoid:
- cluttered controls
- unnecessary menus
- excessive visual effects

---

## Design Principles

- gameplay-first presentation
- synchronized multiplayer clarity
- private prompt handling
- lightweight social interaction
- predictable round flow
