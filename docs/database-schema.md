# Database Schema

## Overview

This document defines the planned database structure for Inner Circle using Supabase/PostgreSQL.

The schema is designed around:
- Circle ownership
- modularity
- realtime collaboration
- scalable shared systems

---

# Core Tables

## users

Represents authenticated users.

Fields (planned):
- id
- email
- display_name
- created_at

Notes:
- Authentication handled by Supabase Auth
- Public profile data stored separately

---

## circles

Represents a private trusted group.

Fields (planned):
- id
- name
- owner_user_id
- created_at

Examples:
- family
- friend group
- roommates

---

## memberships

Connects users to Circles.

Fields (planned):
- id
- user_id
- circle_id
- role
- joined_at
- status

Suggested roles:
- owner
- admin
- member

---

## enabled_modules

Defines which modules are active inside a Circle.

Fields (planned):
- id
- circle_id
- module_key
- enabled_at

Examples:
- family_toolbox
- game_night

---

## sessions

Represents temporary live activities.

Fields (planned):
- id
- circle_id
- module_key
- created_by_user_id
- session_state
- created_at

Examples:
- Game Night session
- future collaborative activities

---

# Planned Relationships

users
  -> memberships
  -> circles

circles
  -> memberships
  -> enabled_modules
  -> sessions

sessions
  -> realtime events
  -> participants

---

# Ownership Rules

- All shared data belongs to a Circle
- Membership controls access
- Sessions inherit Circle permissions

---

# Security Direction

All tables should use:
- Row Level Security (RLS)

Access rules should:
- enforce Circle boundaries
- prevent unauthorized reads/writes

---

# Design Principles

- Keep schema modular
- Avoid duplicated ownership systems
- Support future modules cleanly
- Keep relationships easy to reason about
