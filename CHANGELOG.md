# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [8.1.0] - 2024-12-05

- Update underlying Onfido native SDK versions:
  - Android 22.1.+ (up from 22.0.+)
  - iOS 32.1.+ (up from 32.0.+)

## [8.0.0] - 2024-11-7

- Removed `disableNFC` parameter (Use `nfcOption` with `NFCOptions.Disabled` value instead)
- Update underlying Onfido native SDK versions:
  - Android 22.0.+ (up from 21.2.+)
  - iOS 32.0.+ (up from 30.6.+)

## [7.2.0] - 2024-09-09

- Update underlying Onfido native SDK versions:
  - Android 21.2.+ (up from 21.1.+)
  - iOS 30.6.+ (up from 30.5.+)

## [7.1.0] - 2024-08-21

- Update underlying Onfido native SDK versions:
  - Android 21.1.+ (up from 21.0.+)
  - iOS 30.5.+ (up from 30.4.+)

## [7.0.0] - 2024-07-29
- Bumped Android target SDK version to 34. This update indirectly means that Java version 17 is required to build the project. Details: https://developer.android.com/build/jdks
- Added `nfcOption` parameter for configuring NFC
- Added missing detail property to platform exceptions caused by flow errors
- Deprecated `disableNFC` parameter (Use `nfcOption` with `NFCOptions.Disabled` value instead)
- Updated underlying Onfido native SDK versions:
  - Android 21.0.+ (up from 20.5.+)
  - iOS 30.4.+ (up from 30.3.+)

## [6.2.0] - 2024-07-11

- Align with SDK requirements for minimum support for iOS 13+
- Add Kosovo to the list of countries
- Update underlying Onfido native SDK versions:
  - Android 20.5.+ (up from 20.4.+)
  - iOS 30.3.+ (up from 30.2.+)

## [6.1.0] - 2024-06-17

- Update underlying Onfido native SDK versions:
  - Android 20.4.+ (up from 20.2.+)
  - iOS 30.2.+ (up from 30.0.+)

## [6.0.0] - 2024-04-24

- Motion capture fallback configuration has been removed: Motion is supported on all devices as of 5.1.0
  - If you currently set `withCaptureFallback` on `FaceCapture.motion`, then you should be aware that this configuration is no longer available, so you can safely remove it from your integration code
- `supportDarkMode` and `bubbleErrorBackgroundColor` properties have been removed from `IOSAppearance`
- Update underlying Onfido native SDK versions:
  - Android 20.2.+ (up from 20.1.+)
  - iOS 30.0.+ (up from 29.9.+)

## [5.1.0] - 2024-04-11

- Update underlying Onfido native SDK versions:
  - Android 20.1.+ (up from 20.0.+)
  - iOS 29.9.+ (up from 29.8.0)

## [5.0.0] - 2024-02-05

- Update underlying Onfido native SDK versions:
  - Android 20.0.+ (up from 19.6.+)
  - iOS 29.8.+ (up from 29.7.+)

## [4.5.0] - 2024-02-05

- Update underlying Onfido native SDK versions:
  - Android 19.6.+ (up from 19.5.+)
  - iOS 29.7.+ (up from 29.6.+)

## [4.4.0] - 2023-12-15

- Onfido flow is presented on iOS in the fullscreen mode instead of the modal mode
- Update underlying Onfido native SDK versions:
  - Android 19.5.+ (up from 19.4.+)
  - iOS 29.6.+ (up from 29.5.+)

## [4.3.0] - 2023-11-06

- Update underlying Onfido native SDK versions:
  - Android 19.4.+ (up from 19.3.+)
  - iOS 29.5.+ (up from 29.5.+)

## [4.2.0] - 2023-10-12

- Update underlying Onfido native SDK versions:
  - Android 19.3.+ (up from 19.2.+)
  - iOS 29.5.+ (up from 29.4.+)

## [4.1.1] - 2023-10-03
- Public: (Minor) Fix Changelog formatting

## [4.1.0] - 2023-09-06

- Public: Introduced Onfido theme selection (LIGHT, DARK, AUTOMATIC) in Onfido configuration parameters.
- Public: Introduced background color customisation on iOS
- Public: Updated underlying Onfido native SDK versions:
  - Android 19.2.+ (up from 19.1.+)
  - iOS 29.4.+ (up from 29.2.+)

## [4.0.0] - 2023-07-27

- Public: Introduced a breaking change to the `FlowSteps.faceCapture` implementation to offer more flexibility and control over face capture configurations. Please refer to [MIGRATION.md](MIGRATION.md) for migration guidance.
- Public: Added support for custom media callbacks.
- Public: Updated underlying Onfido native SDK versions:
  - Android 19.1.+ (up from 16.3.1)
  - iOS 29.2.+ (up from 28.3.0)

## [3.3.0] - 2023-04-20

- Public: Update underlying Onfido native SDK versions:
  - Android 16.3.1 (up from 16.2.0)
  - iOS 28.3.0 (up from 28.2.0)

## [3.2.0] - 2023-04-03
- Public: Update underlying Onfido native SDK versions:
  - Android 16.2.0 (up from 16.1.0)
  - iOS 28.2.0 (up from 28.1.0)
- Enable Enterprise features for Studio

## [3.1.0] - 2023-03-07

- Public: Update underlying Onfido native SDK versions:
  - Android 16.1.0 (up from 16.0.1)
  - iOS 28.1.0 (up from 28.0.0)

## [2.2.0] - 2023-01-27

- Public: Update underlying Onfido native SDK versions:
  - Android 15.4.0 (up from 15.3.0)

## [2.1.0] - 2023-01-13

- Public: Added NFC support

## [2.0.0] - 2022-11-25

### Changed:
- Public: Update underlying Onfido native SDK versions:
  - iOS 27.0.0 (up from 26.0.1)
  - Android 14.0.0 (up from 13.0.0)

## [1.0.0] - 2022-09-13

### Added:
- Public: MVP release of Flutter SDK.
    * Android 13.0.0
    * iOS 26.0.1
