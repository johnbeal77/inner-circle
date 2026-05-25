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
- Family Toolbox and Game Night appear as modules

---

## Phase 5 — Family Toolbox MVP

Goals:
- shared grocery list
- basic chores list

Output:
- first practical household tools

---

## Phase 6 — Game Night MVP

Goals:
- create Game Night session
- invite players
- launch Game Hat
- collect prompts
- run basic turn flow

Output:
- first playable shared game experience

---

## Development Rule

Do not build future phases early unless explicitly approved.

Favor small working slices over large unfinished systems.
