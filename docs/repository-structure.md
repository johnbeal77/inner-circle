# Repository Structure

## Overview

This document defines the intended high-level repository structure for the Inner Circle MVP.

The repository structure should reflect:
- platform ownership
- shared infrastructure boundaries
- modular organization
- reusable systems
- deterministic architecture

---

## Core Principle

Repository structure should mirror architectural ownership.

Folders should communicate:
- ownership
- responsibility
- dependency direction
- system boundaries

Avoid:
- ambiguous structure
- mixed ownership folders
- infrastructure duplication
- unclear module boundaries

---

## High-Level Flutter Structure

```text
lib/
  app/
  platform/
  shared/
  modules/
    game_night/
      game_hat/
