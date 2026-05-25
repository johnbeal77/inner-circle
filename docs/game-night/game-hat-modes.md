# Game Hat Modes

## Overview

Game Hat supports multiple prompt-based play modes using the same core prompt, turn, timer, and scoring systems.

The first planned modes are:
- Act It Out
- Draw It

---

## Core Principle

Modes should change presentation and player behavior, not the underlying Game Hat engine.

Shared systems:
- prompt pool
- Active Player
- Players
- scoring
- timer
- role rotation

---

## Act It Out

The Active Player receives a prompt and acts it out.

Rules:
- Active Player may not speak the prompt
- Other Players guess verbally or socially
- Active Player selects the winning Player

---

## Draw It

The Active Player receives a prompt and draws it.

Rules:
- Active Player may not write the prompt as text
- Other Players guess verbally or socially
- Active Player selects the winning Player

---

## Shared Mode Requirements

Both modes use:
- same prompt assignment rules
- same scoring rules
- same timer system
- same role rotation rules
- same session lifecycle

---

## Future Modes

Possible future modes:
- Describe It
- Challenge It
- Trivia Hat
- Team Prompt Mode

---

## Design Principles

- modes should remain lightweight
- avoid duplicating logic between modes
- keep mode-specific behavior isolated
- reuse Game Hat systems wherever possible
