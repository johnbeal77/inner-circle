# Future Game Tools

## Purpose

This document captures future Game Night and tabletop-related ideas without adding them to MVP scope.

These ideas should influence architecture but should not be implemented until explicitly promoted into scope.

---

## Tabletop RPG Tools

Potential future folder:

docs/tabletop-rpg/

Possible tools:
- HP/MP tracker
- inventory tracker
- initiative tracker
- dice roller
- campaign notes
- maps
- caves/dungeons
- taverns/inns
- NPC manager
- quest tracker

---

## Atmosphere and Soundboard

Possible uses:
- tavern ambience
- battle music
- dice rolling sounds
- beast growls
- clanging mugs/dishes
- suspense timers
- Game Hat countdown music

Architecture note:
Atmosphere and audio should use shared audio/feedback infrastructure.

---

## Trivia System

Possible tools:
- host-led trivia
- timed questions
- team scoring
- buzz-in support
- category selection
- question packs
- reveal answers
- leaderboard

Architecture note:
Trivia should reuse shared sessions, timers, realtime, scoring, and invitations.

---

## Karaoke Queue

Possible tools:
- song queue
- singer rotation
- voting
- host controls
- performance order
- optional scoring

Architecture note:
Karaoke Queue is a Game Night social coordination tool, not part of MVP.

---

## Random Utility Tools

Possible tools:
- dice roller
- coin flipper
- spinner
- card drawer/deck manager
- random player picker
- turn order generator

---

## Design Rule

These tools are future-compatible architecture targets, not MVP features.

Do not implement until explicitly promoted.
