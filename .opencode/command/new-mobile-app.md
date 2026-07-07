---
description: Scaffold an Expo/React Native or Flutter mobile app with navigation and state management.
agent: mobile-dev
---

You are scaffolding a new mobile application.

## Requirements
- App name: $ARGUMENTS
- Stack: Expo + React Native + TypeScript (preferred) or Flutter
- Navigation: Expo Router (or Go Router for Flutter)
- State: Zustand + TanStack Query

## Steps

1. **Create the project**
   - If user specified `--flutter`, use Flutter
   - Default: `npx create-expo-app@latest --template blank-typescript`

2. **Set up navigation**
   - Expo Router: file-based routing
   - Create basic layout with tabs (Home, Profile, Settings)

3. **Install dependencies**
   - `npx expo install expo-router expo-linking expo-constants expo-status-bar`
   - `npm install zustand @tanstack/react-query`
   - `npx expo install expo-secure-store expo-localization`

4. **Set up project structure**
   ```
   app/
   ├── _layout.tsx        # Root layout
   ├── index.tsx          # Home
   ├── (tabs)/
   │   ├── _layout.tsx
   │   └── profile.tsx
   ├── stores/
   ├── components/
   └── lib/
   ```

5. **Add native APIs**
   - Camera, location, notifications if applicable
   - Secure store for auth tokens

6. **Verify it works**
   - `npx expo start` should launch
   - Basic app with navigation renders

7. **Initialize git**
   - `git init && git add -A && git commit -m "Initial scaffold"`
