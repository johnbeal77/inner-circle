# Data Model

## Overview

Inner Circle is built around shared group ownership.

All shared data belongs to a Circle.

Users interact with data through Circle membership.

---

# Core Entities

## User

A User represents an authenticated account.

A User may belong to multiple Circles.

A User may:
- create Circles
- join Circles
- participate in modules
- own personal settings

---

## Circle

A Circle is a private shared group.

Examples:
- family
- friend group
- roommates
- recurring game group

A Circle contains:
- members
- modules
- shared data
- sessions

---

## Membership

Membership connects a User to a Circle.

Membership may contain:
- role
- permissions
- status
- nickname/display preferences

---

## Module

A Module is a feature system operating inside a Circle.

Examples:
- Family Toolbox
- Game Night

Modules should only access data scoped to their Circle.

---

## Session

A Session is a temporary live activity inside a module.

Examples:
- Game Night session
- future collaborative activities

Sessions may contain:
- participants
- state
- timers
- realtime events

---

# Ownership Rules

- All shared data belongs to a Circle
- Modules do not own Users
- Sessions belong to a Circle
- Membership controls access

---

# Permission Principles

Permissions should remain simple initially.

Suggested roles:
- Owner
- Admin
- Member

---

# Backend Direction

Preferred backend:
- Supabase

Primary services:
- Authentication
- Postgres database
- Realtime sync
- Storage

---

# Design Goals

- Keep relationships simple
- Avoid duplicated ownership systems
- Maintain strict Circle boundaries
- Support realtime collaboration
