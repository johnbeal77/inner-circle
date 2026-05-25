# Game Hat Prompt Assignment

## Overview

This document defines how Game Hat assigns prompts to the Active Player.

Prompt assignment must be fair, predictable, and prevent players from receiving their own prompts.

---

## Core Rule

The Active Player must never receive a prompt they created.

---

## Prompt Pool

Each Game Hat session has a session-scoped prompt pool.

Each prompt tracks:
- prompt text
- creator participant
- used status
- session ID

---

## Assignment Flow

For each round:

1. Identify Active Player
2. Filter prompt pool:
   - exclude used prompts
   - exclude prompts created by Active Player
3. Select one eligible prompt
4. Mark prompt as assigned or used according to round state
5. Begin round

---

## If No Eligible Prompt Exists

If the Active Player has no eligible prompts available:

Preferred MVP behavior:
- skip that Active Player
- move role to another Player with eligible prompts

Future options:
- allow fallback prompts
- allow prompt reuse
- end session automatically

---

## Shuffle Rules

Before gameplay:
- prompt pool should be shuffled
- assignment should respect shuffled order
- eligibility rules override shuffle order

---

## Prompt Visibility

During gameplay:
- Active Player sees the prompt
- other Players do not see the prompt text
- Active Player sees who submitted the prompt
- Active Player should announce who submitted it

---

## Prompt Usage

Default rule:
- each prompt is used once

A prompt becomes used when:
- round completes
- prompt is skipped
- timer expires

---

## Design Principles

- fairness over randomness
- no self-prompts
- predictable fallback behavior
- session-scoped prompt history
