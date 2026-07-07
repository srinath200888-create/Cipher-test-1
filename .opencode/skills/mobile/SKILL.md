---
name: mobile
description: Use when building mobile applications with React Native, Expo, or Flutter. Covers setup, navigation, state management, native APIs, and app store deployment. Trigger keywords: mobile, iOS, Android, React Native, Expo, Flutter, app store
---

# Mobile App Development

## Framework Choice
- **Expo + React Native**: Best for most apps. Fast dev cycle, OTA updates, wide ecosystem.
- **Flutter**: Best for custom UI, high-performance graphics, cross-platform consistency.
- **React Native CLI**: Only when you need native modules not available in Expo.

## Expo Setup
```bash
npx create-expo-app@latest my-app --template blank-typescript
cd my-app
npx expo start
```

## Expo Router (File-Based Navigation)
```
app/
├── _layout.tsx      # Root layout
├── index.tsx        # Home screen
├── settings.tsx     # Settings screen
└── (tabs)/
    ├── _layout.tsx  # Tab layout
    ├── feed.tsx
    └── profile.tsx
```

## State Management
```typescript
// Zustand for global state
import { create } from "zustand";

interface AuthState {
  user: User | null;
  setUser: (user: User | null) => void;
}

export const useAuthStore = create<AuthState>((set) => ({
  user: null,
  setUser: (user) => set({ user }),
}));
```

## Native APIs (Expo)
```typescript
import * as ImagePicker from "expo-image-picker";
import * as Location from "expo-location";
import * as Notifications from "expo-notifications";

// Camera
const result = await ImagePicker.launchCameraAsync();

// Location
let { status } = await Location.requestForegroundPermissionsAsync();
let location = await Location.getCurrentPositionAsync({});

// Notifications
const token = await Notifications.getExpoPushTokenAsync();
```

## App Store Deployment
```bash
# Build for stores
eas build --platform ios
eas build --platform android

# Submit to stores
eas submit --platform ios
eas submit --platform android
```

## Flutter Alternative
```bash
flutter create my_app
cd my_app
flutter run
flutter build ios
flutter build apk
```
