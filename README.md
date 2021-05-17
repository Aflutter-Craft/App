A platform for image style transfer, this is the cross platform application, check here for the [API](https://github.com/Blacksuan19/Aflutter-Craft-API) and [here](https://github.com/Aflutter-Craft/Network) for the model implementation.

[![Build Android App](https://github.com/Aflutter-Craft/App/actions/workflows/build-android-app.yml/badge.svg)](https://github.com/Aflutter-Craft/App/actions/workflows/build-android-app.yml)
[![Build Linux Application](https://github.com/Aflutter-Craft/App/actions/workflows/build-linux-app.yml/badge.svg?branch=master)](https://github.com/Aflutter-Craft/App/actions/workflows/build-linux-app.yml)

## Supported Platform

the code is written with all platforms is mind, however it was only tested on:

- Android
- Linux
- Web

## Getting started

this project is fully [null-safe](https://dart.dev/null-safety) and uses the master channel of flutter.

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

`flutter_launcher_icons` is already set up to generate app icons with adaptive icons.

- run `flutter pub run flutter_launcher_icons:main`

### Generating App Splash

`flutter_native_splash` is already set up to generate native splash screens for IOS, android and the web.

- run `flutter pub run flutter_native_splash:create`

## Directory Structure

```
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

![](screens/1.png)

![](screens/2.png)

![](screens/3.png)

![](screens/4.png)

![](screens/5.png)
