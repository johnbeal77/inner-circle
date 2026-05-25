# Supabase Architecture

## Overview

Inner Circle uses Supabase as its backend platform.

Supabase is responsible for:
- authentication
- database storage
- realtime synchronization
- file storage
- permissions enforcement

---

# Core Services

## Authentication

Supabase Auth manages:
- user accounts
- login sessions
- identity management

Supported providers may include:
- email/password
- Google
- Apple

---

# Database

Primary database:
- PostgreSQL (via Supabase)

The database stores:
- users
- Circles
- memberships
- modules
- sessions
- shared module data

---

# Realtime

Supabase Realtime is used for:
- multiplayer sessions
- timers
- shared updates
- live synchronization

Examples:
- Game Night countdowns
- score updates
- player state changes

---

# Storage

Supabase Storage may be used for:
- profile images
- shared media
- future uploads

---

# Core Table Direction (Planned)

## users
Authenticated user profiles.

---

## circles
Shared trusted groups.

---

## memberships
Relationship between users and circles.

Contains:
- role
- permissions
- membership status

---

## modules
Enabled modules inside a Circle.

Examples:
- Family Toolbox
- Game Night

---

## sessions
Temporary live module activities.

Examples:
- Game Night sessions

---

# Realtime Design Principles

Realtime updates should:
- remain Circle-scoped
- minimize unnecessary broadcasts
- support multiplayer synchronization

---

# Security Principles

- All access must be Circle-scoped
- Users should only access authorized Circle data
- Row Level Security (RLS) should be enabled

---

# Authentication Principles

- Authentication should remain centralized
- Modules should not manage authentication directly
- User identity should remain platform-level

---

# Design Goals

- scalable realtime collaboration
- secure shared ownership
- modular backend structure
- clean separation between platform and modules
