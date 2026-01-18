# App Store & Google Play Store - Deployment Guide

## App Information

**App Name**: AI Leerapp
**Package Name**: com.aileerapp.app
**Version**: 1.0.0 (Build 1)
**Category**: Education
**Age Rating**: 4+ (iOS) / Everyone (Android)

## Description (Short)

Een AI-gestuurde leerapp met woordenlijsten, flitskaarten en focus-sessies voor effectief leren.

## Description (Full)

AI Leerapp is de ultieme leercompagnon die vier krachtige pijlers combineert:

🤖 **AI Leren**
Stel vragen en krijg uitleg op jouw niveau. De AI past zich aan en kan quizzen genereren.

📚 **Woorden Leren**
Leer nieuwe woorden met spaced repetition voor optimale memorisatie. Ondersteunt meerdere talen.

🎴 **Flitskaarten**
Maak je eigen flashcards of importeer ze uit AI-antwoorden. Perfect voor actief leren.

⏱️ **Focus Sessies**
Timer met app-blokkering helpt je geconcentreerd blijven. Verdien beloningen en bouw streaks op.

**Features:**
- Adaptieve AI-vragen op basis van jouw niveau
- Spaced Repetition System (SRS) voor woorden
- Dagelijkse doelen en voortgang tracking
- Gamification met punten, streaks en prestaties
- Offline basisfunctionaliteit
- Donkere modus ondersteuning

Perfect voor studenten, taalliefhebbers en iedereen die effectiever wil leren!

## Keywords

leren, studeren, AI, woorden, talen, flitskaarten, flashcards, focus, concentratie, spaced repetition, educatie, studie app

## Screenshots Required

### iOS (iPhone)
- 6.5" display: 1242 x 2688 pixels
- Minimum 3 screenshots, maximum 10

### Android
- Phone: 1080 x 1920 pixels (minimum)
- Tablet: 1536 x 2048 pixels (optional)
- Minimum 2 screenshots, maximum 8

**Suggested Screenshots:**
1. Home dashboard met dagelijkse doelen
2. AI chat interface
3. Woorden leren - quiz mode
4. Flitskaarten overzicht
5. Focus sessie actief
6. Profiel met statistieken

## App Store Specific

### iOS Build Process
```bash
# Ensure proper signing certificates
flutter build ios --release

# Archive and upload via Xcode or Transporter
```

### Requirements
- Apple Developer Account ($99/year)
- App Store Connect configuration
- Privacy Policy URL
- Support URL
- Age rating questionnaire completed

## Google Play Store Specific

### Android Build Process
```bash
# Build App Bundle (recommended)
flutter build appbundle --release

# Or build APK
flutter build apk --release
```

### Requirements
- Google Play Developer Account ($25 one-time)
- Content rating questionnaire
- Privacy Policy
- Feature graphic: 1024 x 500 pixels
- App icon: 512 x 512 pixels

## Privacy & Permissions

### iOS (Info.plist)
- NSMicrophoneUsageDescription (optional - for audio)
- NSCameraUsageDescription (optional - for images)
- NSPhotoLibraryUsageDescription (optional)

### Android (AndroidManifest.xml)
- INTERNET (for AI API)
- WAKE_LOCK (for focus sessions)
- VIBRATE (for notifications)
- POST_NOTIFICATIONS (Android 13+)

## Testing Checklist

- [ ] Test on multiple device sizes
- [ ] Test dark mode
- [ ] Test offline functionality
- [ ] Test all navigation flows
- [ ] Test focus session timer
- [ ] Test data persistence
- [ ] Verify privacy policy link
- [ ] Check for memory leaks
- [ ] Performance testing
- [ ] Accessibility testing

## Launch Checklist

### Pre-Launch
- [ ] Finalize app description
- [ ] Create promotional graphics
- [ ] Take required screenshots
- [ ] Set up pricing (free/paid)
- [ ] Complete age rating
- [ ] Add privacy policy URL
- [ ] Test builds on real devices

### iOS App Store
- [ ] Create App Store Connect entry
- [ ] Upload build via Xcode/Transporter
- [ ] Fill in metadata
- [ ] Submit for review
- [ ] Monitor review status

### Google Play Store
- [ ] Create Play Console entry
- [ ] Upload app bundle
- [ ] Fill in store listing
- [ ] Create release
- [ ] Submit for review

## Post-Launch

- Monitor crash reports
- Respond to user reviews
- Track download metrics
- Plan updates based on feedback
- Regular security updates

## Support & Resources

- Flutter Documentation: https://flutter.dev/docs
- Apple Developer: https://developer.apple.com
- Google Play Console: https://play.google.com/console
- App Store Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- Google Play Policy: https://play.google.com/about/developer-content-policy/

## Contact

For technical support during deployment:
- Email: dev@aileerapp.com
- Website: https://aileerapp.com
