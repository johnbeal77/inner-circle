# Codex Instructions

## Purpose

This repository uses documentation as the source of truth.

Codex should read and follow the docs before making implementation decisions.

---

## Core Rule

Do not invent architecture when documented architecture exists.

If implementation conflicts with documentation:
- stop
- explain the conflict
- propose a documentation update before coding

---

## Required Reading Before Code Changes

Codex should start with:

- README.md
- docs/architecture-index.md
- docs/shared-architecture-principles.md
- docs/system-ownership-map.md
- docs/implementation-guardrails.md
- docs/implementation-plan.md
- docs/implementation-roadmap.md
- docs/mvp-scope.md
- docs/repository-structure.md
- docs/initial-technical-decisions.md
- docs/supabase-schema-v1.md

For Game Night or Game Hat work, Codex should also review:

- docs/game-night/game-night.md
- docs/game-night/session-flow.md
- docs/game-night/game-hat.md
- docs/game-night/game-hat-state-machine.md
- docs/game-night/game-hat-prompt-submission.md
- docs/game-night/game-hat-prompt-assignment.md
- docs/game-night/game-hat-scoring-and-rotation.md
- docs/game-night/game-hat-active-round.md
- docs/game-night/game-hat-timer-system.md
- docs/game-night/game-hat-reconnect-behavior.md

---

## Implementation Principles

- Build in small phases
- Keep modules isolated
- Keep shared systems centralized
- Do not overbuild
- Do not skip ahead to future phases
- Prefer simple working foundations over complex unfinished systems
- Use Game Night and Game Hat as the first proof of the shared live-session architecture

---

## Coding Rules

- Follow the repository structure in `docs/repository-structure.md`
- Use Riverpod for initial state management
- Keep business logic separate from UI
- Keep Game Hat engine logic testable and UI-independent
- Avoid duplicated infrastructure
- Keep Circle-scoped data boundaries clear
- Use shared components and shared infrastructure where appropriate
- Do not create a global `/tools` folder unless reuse outside Game Night is explicitly approved

---

## MVP Scope Rules

The MVP should prioritize:
- platform scaffold
- Supabase auth/profile/Circle/membership
- Game Night as the first enabled module
- shared session infrastructure
- Game Hat Act It Out
- Draw It as physical/off-app drawing only unless explicitly expanded later

Do not build yet:
- Family Toolbox MVP
- in-app drawing canvas
- AI prompt generation
- advanced analytics
- push notifications
- tournament/ranking systems
- complex moderation tooling

---

## Summary

Codex should behave like an implementation assistant, not an independent product designer.

Architecture decisions should be made deliberately in documentation before implementation.
