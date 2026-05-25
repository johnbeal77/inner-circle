# Permissions and Roles

## Overview

Inner Circle uses simple role-based permissions to control access inside each Circle.

Permissions should remain understandable and predictable.

---

## Core Principle

Permissions are Circle-scoped.

A user may have different roles in different Circles.

---

## Roles

### Owner

The Owner controls the Circle.

Can:
- rename Circle
- delete Circle
- invite members
- remove members
- manage roles
- enable or disable modules

---

### Admin

Admins help manage the Circle.

Can:
- invite members
- manage most module settings
- moderate shared content

Cannot:
- delete Circle
- remove Owner

---

### Member

Members participate in the Circle.

Can:
- use enabled modules
- create shared content when allowed
- participate in sessions

Cannot:
- manage Circle settings
- manage other members

---

## Module Permissions

Modules may define additional permissions, but they must not bypass Circle roles.

Examples:
- Game Night Host
- Chore Manager
- Grocery List Editor

---

## Design Principles

- Keep permissions simple
- Avoid too many roles early
- Prefer clear defaults
- Never expose Circle data to non-members

---

## Summary

Permissions protect shared spaces while keeping Inner Circle easy to understand.
