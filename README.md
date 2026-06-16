# Inner Circle

Inner Circle is a modular shared platform for trusted groups such as families, friends, roommates, and recurring social groups.

It provides private Circles where members can coordinate daily life, use shared tools, and participate in social experiences.

---

## Current Status

This project is in early implementation.

The repository contains architecture, planning, and system ownership documentation, plus the initial Flutter scaffold. Phase 2 adds the Supabase foundation for client setup, email/password authentication, and profile completion.

---

## Core Concept

Inner Circle is the platform.

A Circle is a private shared space.

Modules live inside Circles.

Planned modules include:

- Family Toolbox
- Game Night
- Recipes
- Planning tools

---

## First Major Module

The first major planned module is **Game Night**.

Game Night contains **Game Hat**, a prompt-based play tool for modes such as:

- Act It Out
- Draw It

Game Hat is intended to replace the physical experience of drawing paper slips from a hat.

---

## Architecture Principles

Inner Circle is designed around:

- ownership-first architecture
- reusable shared infrastructure
- Circle-scoped data
- deterministic state and events
- reconnect-safe realtime behavior
- shared-device support
- accessibility-first design
- documentation-driven development

---

## Documentation Entry Points

Start here:

- `docs/architecture-index.md`
- `docs/shared-architecture-principles.md`
- `docs/system-ownership-map.md`
- `docs/mvp-scope.md`
- `docs/implementation-roadmap.md`
- `docs/implementation-guardrails.md`
- `docs/repository-structure.md`
- `docs/local-development.md`

---

## Development Rule

Documentation is the source of truth.

If implementation conflicts with documentation, pause implementation and resolve the architectural conflict before coding.
