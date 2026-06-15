# Implementation Plan

## Overview

Inner Circle should be built in controlled phases.

Each phase should produce a working, testable result before moving forward.

---

## Phase 1 — Platform Scaffold

Goals:
- create Flutter project
- establish folder structure
- add theme/navigation shell
- create placeholder Circle and module screens

Output:
- app launches successfully
- basic navigation works
- no backend required yet

---

## Phase 2 — Supabase Foundation

Goals:
- connect Supabase
- add authentication
- create user profile flow
- prepare environment configuration

Output:
- users can sign up, log in, and log out

---

## Phase 3 — Circle System

Goals:
- create Circles
- list user Circles
- select active Circle
- add basic membership rules

Output:
- users can enter a Circle Home screen

---

## Phase 4 — Module System

Goals:
- register modules
- show enabled modules per Circle
- create placeholder modules

Output:
- Game Night appears as an enabled module.
- Family Toolbox may exist as a placeholder only.

---

## Phase 5 — Shared Session Infrastructure

Goals:
- session lifecycle
- participants
- presence
- realtime synchronization
- timers
- validation

Output:
- reusable live-session foundation

---

## Phase 6 — Game Night MVP

Goals:
- create session
- invite players
- Game Hat
- prompt submission
- prompt assignment
- Act It Out gameplay
- scoring
- reconnect handling

Output:
- first playable multiplayer experience

---

## Phase 7 — Family Toolbox MVP

Goals:
- grocery list
- chores

Output:
- first household productivity tools


## Development Rule

Do not build future phases early unless explicitly approved.

Favor small working slices over large unfinished systems.
