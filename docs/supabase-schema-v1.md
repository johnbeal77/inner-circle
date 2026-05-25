# Supabase Schema v1

## Overview

This document defines the first planned Supabase/PostgreSQL schema for Inner Circle.

The goal is to support:
- users
- Circles
- memberships
- modules
- sessions
- Game Night / Game Hat foundations

---

## Auth Users

Supabase Auth manages authenticated users.

Application profile data should be stored separately.

---

## profiles

Stores public app profile information.

Fields:
- id (uuid, references auth.users.id)
- display_name
- avatar_url
- created_at
- updated_at

---

## circles

Stores private shared groups.

Fields:
- id (uuid)
- name
- description
- owner_user_id (references profiles.id)
- status
- created_at
- updated_at

Status values:
- active
- archived
- deleted

---

## memberships

Connects users to Circles.

Fields:
- id (uuid)
- circle_id (references circles.id)
- user_id (references profiles.id)
- role
- status
- created_at
- updated_at

Role values:
- owner
- admin
- member

Status values:
- invited
- accepted
- declined
- removed
- left

---

## enabled_modules

Defines which modules are enabled inside a Circle.

Fields:
- id (uuid)
- circle_id (references circles.id)
- module_key
- enabled_at
- enabled_by_user_id (references profiles.id)

Example module keys:
- family_toolbox
- game_night
- recipes
- planning

---

## sessions

Stores shared live activities.

Fields:
- id (uuid)
- circle_id (references circles.id)
- module_key
- tool_key
- host_user_id (references profiles.id)
- state
- settings_json
- created_at
- updated_at
- completed_at

Example module_key:
- game_night

Example tool_key:
- game_hat

---

## session_participants

Stores participants in a session.

Fields:
- id (uuid)
- session_id (references sessions.id)
- user_id (references profiles.id, nullable for future guests)
- display_name
- role
- status
- score
- joined_at
- updated_at

Roles:
- host
- player
- active_player

Statuses:
- invited
- accepted
- declined
- active
- disconnected
- removed

---

## game_hat_prompts

Stores Game Hat prompts.

Fields:
- id (uuid)
- session_id (references sessions.id)
- created_by_participant_id (references session_participants.id)
- prompt_text
- used
- created_at

Rules:
- prompt creator must be tracked
- Active Player must not receive their own prompt
- prompts are session-scoped

---

## game_hat_rounds

Stores Game Hat round history.

Fields:
- id (uuid)
- session_id (references sessions.id)
- round_number
- active_participant_id (references session_participants.id)
- prompt_id (references game_hat_prompts.id)
- winner_participant_id (references session_participants.id, nullable)
- result
- started_at
- ended_at

Result values:
- completed
- skipped
- timeout
- cancelled

---

## Security Rules

All tables should use Row Level Security.

General rules:
- users can access their own profile
- users can access Circles only through accepted membership
- users can access sessions only within their Circles
- Game Hat data is only accessible to session participants

---

## Realtime Tables

Likely realtime-enabled tables:
- sessions
- session_participants
- game_hat_rounds

Possibly realtime-enabled:
- game_hat_prompts during prompt submission

---

## Design Principles

- keep all shared data Circle-scoped
- keep session data session-scoped
- track creator and participant identity
- support realtime without overcomplicating schema
- avoid premature optimization
