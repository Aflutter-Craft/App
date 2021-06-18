# Aflutter Craft

A platform for image style transfer, this is the cross platform application,
check here for the [API](https://github.com/Blacksuan19/Aflutter-Craft-API) and
[here](https://github.com/Aflutter-Craft/Network) for the model implementation.

[![Build Android App](https://github.com/Aflutter-Craft/App/actions/workflows/build-android-app.yml/badge.svg)](https://github.com/Aflutter-Craft/App/actions/workflows/build-android-app.yml)
[![Build Linux Application](https://github.com/Aflutter-Craft/App/actions/workflows/build-linux-app.yml/badge.svg?branch=master)](https://github.com/Aflutter-Craft/App/actions/workflows/build-linux-app.yml)
[![Windows Application](https://github.com/Aflutter-Craft/App/actions/workflows/build-windows-app.yml/badge.svg)](https://github.com/Aflutter-Craft/App/actions/workflows/build-windows-app.yml)

## Supported Platform

the code is written with all platforms in mind, however it was only tested on:

- Android
- Linux
- Web

## Downloads

check [releases](https://github.com/Aflutter-Craft/App/releases) for prebuilt
binaries for Android, Windows and Linux.
[Actions](https://github.com/Aflutter-Craft/App/actions) also have prebuilt
binaries that are always up to date.

## Getting started

this project is fully [null-safe](https://dart.dev/null-safety) and uses the
master channel of flutter.

- first switch to the master branch with `flutter channel master`
- fetch the packages with `flutter pub get`
- start coding or building for a specific platform.
- for details on how to build:
  - [Web](https://flutter.dev/docs/deployment/web)
  - [Linux](https://flutter.dev/docs/deployment/linux)
  - [Android](https://flutter.dev/docs/deployment/android)
  - [IOS](https://flutter.dev/docs/deployment/ios)
  - [windows](https://flutter.dev/desktop#windows)

### Generating App Icons

`flutter_launcher_icons` is already set up to generate app icons with adaptive
icons.

- run `flutter pub run flutter_launcher_icons:main`

### Generating App Splash

`flutter_native_splash` is already set up to generate native splash screens for
IOS, android and the web.

- run `flutter pub run flutter_native_splash:create`

## Directory Structure

```bash
lib
├── models          # data models
├── screens         # application pages
│   ├── common      # pages common between all platforms
│   ├── desktop     # desktop/web pages
│   └── mobile      # mobile pages
├── utils           # utilities
└── widgets         # components
```

## Screenshots

![mobile](screens/1.png)

![desktop](screens/2.png)

![style store](screens/3.png)

![style view](screens/4.png)

![about](screens/5.png)
