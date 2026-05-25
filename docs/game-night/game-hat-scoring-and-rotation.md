# Game Hat Scoring and Rotation

## Overview

This document defines how Game Hat awards points and determines the next Active Player.

---

## Core Roles

### Host
The Player who created and configured the session.

### Player
Any accepted participant in the session.

### Active Player
The Player currently receiving and performing a prompt.

---

## Default Scoring Rule

The Player who correctly guesses the prompt wins the round.

Default score:
- +1 point to the winning Player

---

## Winner Selection

The Active Player selects the winning Player on their device.

This keeps scoring human-controlled and flexible.

---

## No Winner

If no Player guesses correctly:

Possible outcomes:
- no points awarded
- prompt marked used
- role rotates according to configured rule

---

## Skip

If the Active Player skips:

- no points awarded
- prompt marked used
- role rotates according to configured rule

---

## Timeout

If timer expires:

- no points awarded
- prompt marked used
- role rotates according to configured rule

---

## Default Role Rotation

Default rule:
- winning Player becomes the next Active Player

This creates a natural social flow.

---

## Pass Option

After a round, the next Active Player may pass the role.

If passing:
- they choose another Player
- or Host selects next Player

---

## Alternate Rotation Modes

Future rotation modes may include:

### Sequential
Players rotate in a fixed order.

### Host Choice
Host manually chooses the next Active Player.

### Random
System selects next Active Player randomly.

### Team Mode
Teams rotate instead of individual Players.

---

## Team Scoring (Future)

In team mode:
- winning Player earns points for their team
- Active Player may represent a team
- turn rotation may alternate by team

---

## Design Principles

- keep MVP scoring simple
- allow human judgment
- support future rule variants
- avoid over-automating social play
