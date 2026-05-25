# Authentication Flow

## Overview

Authentication in Inner Circle is platform-level and centralized.

Modules must never manage authentication independently.

Authentication is handled through Supabase Auth.

---

# Authentication Goals

- simple onboarding
- secure account management
- persistent identity across modules
- seamless Circle access

---

# Supported Authentication Methods (Planned)

- Email/password
- Google Sign-In
- Apple Sign-In

Additional providers may be added later.

---

# User Flow

App Launch
  -> Authentication Check
      -> Login / Sign Up
          -> Circle Selection
              -> Circle Home
                  -> Modules

---

# New User Flow

1. User creates account
2. User creates first Circle OR accepts invite
3. User enters Circle Home
4. User accesses enabled modules

---

# Existing User Flow

1. User logs in
2. User selects active Circle
3. User enters Circle Home
4. User accesses modules

---

# Circle Invitations

Users may join Circles through:
- invite links
- direct invitations
- future QR/in-person methods

---

# Active Circle Concept

A user may belong to multiple Circles.

One Circle becomes the active context during app usage.

All module interactions occur within the active Circle.

---

# Authentication Principles

- Authentication is platform-wide
- Modules inherit authenticated user state
- Modules must not create separate login systems
- User identity remains centralized

---

# Session Persistence

Users should remain logged in between app launches whenever possible.

The platform should restore:
- authenticated session
- last active Circle

---

# Security Goals

- secure authentication handling
- centralized identity management
- strict Circle-scoped permissions
- minimal authentication friction

---

# Future Considerations

Possible future features:
- parental approval systems
- child accounts
- temporary guest access
- Circle switching shortcuts
