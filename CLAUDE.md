# timesheet-mobile — Flutter Timesheet App

## Overview

Flutter mobile app for timesheet management. Mirrors the functionality of `timesheet-ui` (web) but designed for mobile use. Uses `graphql_flutter` for API calls, `Provider` for state management, and `GoRouter` for navigation.

## Commands

```sh
flutter pub get                              # Install dependencies
flutter run                                  # Run on connected device/emulator
flutter build apk                            # Build Android APK
flutter test                                 # Run tests
flutter analyze                              # Static analysis
flutter pub run build_runner build           # Regenerate GraphQL Dart code
```

## Architecture

```
lib/
├── features/                    # Feature modules (1 per screen/domain)
│   ├── auth/                    # Login screen
│   ├── dashboard/               # Dashboard screen
│   ├── timesheets/              # Timesheet list, edit, activity management
│   ├── customers/               # Customer CRUD
│   ├── projects/                # Project CRUD
│   ├── settings/                # App settings
│   ├── profile/                 # User profile
│   └── shell/                   # Navigation shell with bottom nav bar
├── core/                        # Core utilities
│   ├── graphql_client.dart      # GraphQL client with Hive store + AuthLink
│   ├── storage.dart             # Secure storage wrapper (flutter_secure_storage)
│   ├── constants.dart           # App constants
│   ├── extensions.dart          # Dart extensions
│   └── time_utils.dart          # Time formatting utilities
├── providers/                   # State management (Provider)
│   ├── auth_provider.dart       # User, organization, settings, token handling
│   └── theme_provider.dart      # Light/dark theme state
├── router/
│   └── app_router.dart          # GoRouter configuration
├── shared/widgets/              # Reusable widgets (StatusIcon, ConfirmDialog, ColorDot)
├── graphql/                     # Schema + generated Dart types
│   ├── schema.graphql           # GraphQL schema definition
│   └── schema.graphql.dart      # Generated types (do not edit)
├── l10n/                        # Localization
├── main.dart                    # Entry point (init Flutter, dotenv, Hive, locale)
└── app.dart                     # Root widget (GraphQL client, providers, router, theme)
```

## State Management

### AuthProvider (`lib/providers/auth_provider.dart`)

- Stores: `AuthUser`, `AuthOrganization`, `TimesheetSettings`
- Reads JWT token from `flutter_secure_storage` on init
- Settings flags control UI visibility: `enableCustomers`, `enableProjects`, required fields
- `minuteStep` configuration for time inputs
- Handles login mutation, token storage, logout, token expiration

### ThemeProvider (`lib/providers/theme_provider.dart`)

- Light/dark mode switching
- Material 3 theme with blue seed color

## GraphQL Client

**File:** `lib/core/graphql_client.dart`

- Uses `HiveStore` for client-side caching
- `AuthLink` prepends `Bearer {token}` to all requests
- Token read from `flutter_secure_storage`
- Endpoint from `.env` file: `GRAPHQLURI`

## Navigation

**File:** `lib/router/app_router.dart`

- `GoRouter` with auth redirect (→ `/login` when not authenticated)
- Initial location: `/timesheets`
- Shell route with bottom navigation bar (dashboard, timesheets, customers, projects, settings, profile)
- Full-screen routes for create/edit flows (pushed outside the shell)

## Features

| Feature | Screens | Description |
|---|---|---|
| `auth` | Login | Email/password login with form validation |
| `dashboard` | Dashboard | Analytics with fl_chart |
| `timesheets` | List, Edit | Month cards with status/total, activity management |
| `customers` | List, Create, Edit | Customer CRUD |
| `projects` | List, Create, Edit | Project CRUD |
| `settings` | Settings | Organization settings |
| `profile` | Profile | User profile |
| `shell` | Shell | Bottom nav wrapper for all feature screens |

## GraphQL Codegen

- Build runner: `flutter pub run build_runner build`
- Config in `build.yaml`
- Custom scalars: `HexColorCode: String`, `YearMonth: String`
- Generated files: `*.graphql.dart` (excluded from analysis)
- Generated file header: `// ignore_for_file: type=lint`

## Environment

**File:** `.env`

- `GRAPHQLURI` — GraphQL endpoint URL
- For Android emulator: use `10.0.2.2` instead of `localhost`

## Conventions

- `flutter_lints` for static analysis
- Generated `*.graphql.dart` files excluded from analysis (`analysis_options.yaml`)
- Italian locale for date formatting
- `flutter_secure_storage` for sensitive data (JWT tokens)
- Provider pattern for state management (not Bloc/Riverpod)
