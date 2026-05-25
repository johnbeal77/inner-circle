# Circle Lifecycle

## Overview

A Circle is the core shared space inside Inner Circle.

All shared tools, modules, sessions, and collaborative data belong to a Circle.

---

## Circle States

A Circle may exist in the following states:

- active
- archived
- deleted

---

## Circle Creation

A user may create a Circle.

The creator becomes the Circle Owner.

Required fields:
- Circle name
- Owner user ID
- created timestamp

Optional future fields:
- Circle description
- icon/avatar
- default enabled modules

---

## Circle Membership

Users join a Circle through Membership records.

A Membership connects:
- user
- Circle
- role
- status

Membership statuses:
- invited
- accepted
- declined
- removed
- left

---

## Joining a Circle

Users may join through:
- direct invite
- invite link
- future QR code

A user does not gain access until membership status is accepted.

---

## Active Circle

A user may belong to multiple Circles.

Only one Circle should be active at a time during normal app use.

The active Circle determines:
- visible modules
- accessible shared data
- active sessions
- notifications shown in context

---

## Switching Circles

Users may switch Circles from platform-level navigation.

Switching Circles changes:
- module context
- available data
- active sessions
- permissions

Modules must reload Circle-scoped data after a Circle switch.

---

## Leaving a Circle

A Member may leave a Circle.

Rules:
- leaving removes access to Circle data
- created content may remain in Circle history
- Owner cannot leave unless ownership is transferred or Circle is deleted

---

## Removing Members

Owners and Admins may remove members depending on role permissions.

Rules:
- Owner cannot be removed by Admin
- removed users immediately lose access
- removed users may be re-invited later

---

## Archiving a Circle

A Circle may be archived.

Archived Circles:
- are read-only by default
- do not show as active by default
- preserve historical data

---

## Deleting a Circle

Only the Owner may delete a Circle.

Deletion should be treated carefully.

Possible future behavior:
- soft delete first
- permanent delete after retention period
- export option before deletion

---

## Design Principles

- Circle boundaries must remain strict
- Membership controls access
- Modules must never bypass Circle context
- Circle switching should be predictable
- Deletion should avoid accidental data loss

---

## Summary

The Circle lifecycle defines how trusted groups are created, joined, managed, archived, and removed.
