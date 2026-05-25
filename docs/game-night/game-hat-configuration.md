# Game Hat Configuration

## Overview

Game Hat supports configurable gameplay settings controlled primarily by the Host.

Configuration systems should remain:
- lightweight
- understandable
- scalable for future modes

---

## Core Principle

Configuration should modify gameplay behavior without requiring different gameplay engines.

The same Game Hat core should support multiple play styles through settings.

---

## Session Configuration Categories

### Prompt Configuration

Possible settings:
- prompts per Player
- custom prompt limits
- allow duplicate prompts
- allow prompt reuse

---

### Timer Configuration

Possible settings:
- timer enabled/disabled
- round duration
- warning thresholds

---

### Rotation Configuration

Possible settings:
- winner becomes next Active Player
- sequential rotation
- Host-selected rotation
- random rotation

---

### Scoring Configuration

Possible settings:
- score values
- team scoring
- no-score casual mode

---

### Mode Configuration

Possible settings:
- Act It Out
- Draw It
- future modes

Modes should reuse core Game Hat systems whenever possible.

---

## Host Responsibilities

The Host may:
- configure session settings
- adjust settings before session start
- optionally lock settings after gameplay begins

---

## Player Visibility

Players should clearly understand:
- active mode
- timer rules
- scoring rules
- rotation rules
- prompt requirements

---

## MVP Philosophy

The MVP should prioritize:
- simple defaults
- minimal setup friction
- socially intuitive settings

Avoid:
- excessive configuration depth
- overwhelming setup screens
- highly competitive rule complexity

---

## Future Possibilities

Possible future additions:
- saved presets
- Circle defaults
- family-friendly presets
- party presets
- advanced custom rules

---

## Design Principles

- simple defaults
- scalable configuration structure
- shared engine behavior
- low-friction session setup
