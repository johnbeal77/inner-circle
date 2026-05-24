# Architecture

## System Layers

Inner Circle is structured in three layers:

---

## 1. Platform Layer (Inner Circle)

Responsible for:
- user identity
- Circle creation and membership
- permissions
- shared state boundaries

---

## 2. Module Layer

Responsible for:
- feature sets (Family Toolbox, Game Night, etc.)
- module-specific logic
- UI and workflows inside a module

Modules DO NOT manage:
- user accounts
- Circle membership
- global state

---

## 3. Engine Layer (Optional Advanced Layer)

Some modules may contain internal engines.

Example:
- Game Night contains Game Hat (gameplay engine)

Engines handle:
- rules
- state machines
- runtime behavior

---

## Data Ownership Rule

All data belongs to a Circle.

Modules only read/write within Circle scope.

---

## Design Goals

- modularity
- scalability
- strict separation of concerns
- reusable systems
