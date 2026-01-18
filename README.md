# AI Leerapp

Een AI-gestuurde leerapp met focus-sessies, woordenlijsten en flitskaarten voor iOS en Android.

## Features

- 🤖 **AI Learning**: Stel vragen en krijg uitleg op maat
- 📚 **Woorden Leren**: Woordenlijsten met spaced repetition
- 🎴 **Flitskaarten**: Maak en bestudeer flashcards
- ⏱️ **Focus Sessies**: Timer met app blokkering en beloningen
- 📊 **Voortgang**: Track je leerresultaten en streaks

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK
- Xcode (voor iOS development)
- Android Studio (voor Android development)

### Installation

1. Clone de repository
2. Run `flutter pub get`
3. Run `flutter run`

## Project Structure

```
lib/
  ├── core/              # Core utilities, theme, constants
  ├── features/          # Feature modules
  │   ├── ai/           # AI learning module
  │   ├── woorden/      # Words learning module
  │   ├── flitskaarten/ # Flashcards module
  │   ├── focus/        # Focus sessions module
  │   └── profiel/      # Profile module
  └── shared/           # Shared widgets, models, services
```

## Build for Release

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## License

Copyright © 2026 AI Leerapp
