# Game Hat

## Overview

Game Hat is a Game Night tool that replaces drawing paper slips from a hat.

It supports prompt-based play for modes such as:
- Act It Out
- Draw It

---

## Core Concept

Players submit prompts into a shared virtual hat.

The system shuffles the prompts and gives one to the Active Player.

The Active Player should never receive a prompt they created.

---

## Roles

### Host
Configures the session and starts play.

### Player
Any invited participant who accepted the session.

### Active Player
The player currently receiving and performing a prompt.

---

## Prompt Flow

1. Host configures prompts required per player
2. Players submit prompts one at a time
3. Prompts are collected into a shared pool
4. Prompt pool is shuffled
5. Active Player receives a prompt not created by them
6. Active Player announces who submitted the prompt
7. Other Players guess
8. Active Player selects the winning Player

---

## Scoring

Default scoring:
- winning Player receives 1 point
- Active Player selects the winner

Future options:
- team scoring
- alternate rotation rules
- custom scoring

---

## Turn Rotation

Default rule:
- the winning Player becomes the next Active Player

Optional:
- Active Player may pass the role to another Player
- Host may configure alternate rotation rules

---

## Timer

If enabled:
- all Players see the countdown
- all Players hear timer cues
- timer should stay synchronized across devices

---

## Design Principles

- keep prompt flow simple
- prevent players from receiving their own prompts
- support both acting and drawing with the same core system
- allow future game modes without rewriting the core logic
