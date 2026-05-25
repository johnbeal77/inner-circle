# Error Handling

## Overview

Inner Circle should handle errors clearly, calmly, and consistently.

Errors should never leave users confused about what happened or what to do next.

---

## Core Principle

Errors should be:
- visible
- understandable
- recoverable when possible
- logged for debugging when appropriate

---

## Error Categories

### Authentication Errors
Examples:
- failed login
- expired session
- missing permissions

User response:
- explain the issue
- offer login/retry action

---

### Network Errors
Examples:
- offline state
- Supabase unavailable
- realtime disconnect

User response:
- show connection status
- retry when possible
- avoid data loss

---

### Permission Errors
Examples:
- user not in Circle
- module not enabled
- insufficient role

User response:
- explain access limitation
- do not expose restricted data

---

### Validation Errors
Examples:
- empty prompt
- invalid Circle name
- duplicate input

User response:
- show inline correction guidance

---

## Recovery Principles

- Prefer retry over failure
- Preserve user input whenever possible
- Never silently discard data
- Avoid technical error messages in user-facing UI

---

## Developer Principles

- Log useful technical details
- Keep user messages simple
- Avoid swallowing errors silently
- Use shared error handling patterns

---

## Summary

Consistent error handling makes Inner Circle feel reliable, especially during shared and realtime experiences.
