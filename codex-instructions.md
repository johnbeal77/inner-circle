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

Codex should review:

- docs/inner-circle.md
- docs/design-philosophy.md
- docs/architecture.md
- docs/flutter-architecture.md
- docs/data-model.md
- docs/navigation-architecture.md
- docs/module-loading.md
- docs/state-and-events.md
- docs/realtime-strategy.md
- docs/permissions-and-roles.md
- docs/implementation-plan.md

---

## Implementation Principles

- Build in small phases
- Keep modules isolated
- Keep shared systems centralized
- Do not overbuild
- Do not skip ahead to future phases
- Prefer simple working foundations over complex unfinished systems

---

## Coding Rules

- Follow Flutter feature-based structure
- Keep business logic separate from UI
- Avoid duplicated infrastructure
- Keep Circle-scoped data boundaries clear
- Use shared components where appropriate

---

## Summary

Codex should behave like an implementation assistant, not an independent product designer.
