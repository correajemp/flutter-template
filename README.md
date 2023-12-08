# template app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Firebase: Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=ios)
- [Fastlane: Continuous delivery with Flutter](https://docs.flutter.dev/deployment/cd#fastlane)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:
```sh
# Staging
$ flutter run -t lib/main_staging.dart --flavor staging

# PreProduction
$ flutter run -t lib/main_preproduction.dart --flavor preproduction

# Production
$ flutter run -t lib/main_production.dart --flavor production
```

To build the desired flavor use the following commands:
```sh
# Staging
# iOS
$ flutter build ipa --flavor staging -t lib/main_staging.dart
# Android
$ flutter build apk --flavor staging -t lib/main_staging.dart

# PreProduction
# iOS
$ flutter build ipa --flavor preproduction -t lib/main_preproduction.dart
# Android
$ flutter build apk --flavor preproduction -t lib/main_preproduction.dart

# Production
# iOS
$ flutter build ipa --flavor production -t lib/main_production.dart
# Android
$ flutter build apk --flavor production -t lib/main_production.dart
```

To upload android into firebase app distribution:
```sh
# Staging
$ flutter clean
$ flutter pub get
$ flutter build apk --flavor staging -t lib/main_staging.dart 
$ cd android
$ bundle exec fastlane android deploy_staging_to_firebase

# PreProduction
$ flutter clean
$ flutter pub get
$ flutter build apk --flavor preproduction -t lib/main_preproduction.dart 
$ cd android
$ bundle exec fastlane android deploy_preproduction_to_firebase

# Production
$ flutter clean
$ flutter pub get
$ flutter build apk --flavor production -t lib/main_production.dart 
$ cd android
$ bundle exec fastlane android deploy_production_to_firebase
```

To upload ios into testflight:
```sh
# Staging
$ flutter clean
$ flutter pub get
$ flutter build ipa --flavor staging -t lib/main_staging.dart 
$ cd ios
$ bundle exec fastlane ios deploy_staging_to_testflight

# PreProduction
$ flutter clean
$ flutter pub get
$ flutter build ipa --flavor preproduction -t lib/main_preproduction.dart 
$ cd ios
$ bundle exec fastlane ios deploy_preproduction_to_testflight

# Production
$ flutter clean
$ flutter pub get
$ flutter build ipa --flavor production -t lib/main_production.dart 
$ cd ios
$ bundle exec fastlane ios deploy_production_to_testflight
```