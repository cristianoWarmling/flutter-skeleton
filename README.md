# flutter_skeleton

A skeleton for a flutter project with some packages included (and AndroidX ready).

## Get started

- Replace all **package names** (_flutter_skeleton_) on project to yours
- Android
  - Change the **applicationId** in `[app_folder]\android\app\build.gradle`
  - Put your `google-services.json` inside of `[app_folder]\android\app` with the same **applicationId** choosed
- iOS
  - Change the **Bundle identifier** at _General_ tab on **Runner** using the **XCode**
  - Put your **GoogleService-Info.plist** inside of `[app_folder]\ios\Runner` with the same **Bundle Identifier** choosed,  using the **XCode**

## Folder structure

- `routes.dart`
  - Where will contains all of routes of your app and where all `screens` will be imported.
- `data`
  - Put here your _BLoC_ files
- `model`
  - Where you will put all of your model classes
- `screens`
  - The files of your screens. This files will be imported into `routes.dart`
- `services`
  - All files where you will write business rules or network interactions of your app
- `util`
  - Common utilitary functions, like number/date formatting, string encrypt/decrypt etc.
- `widgets`
  - Common widgets of your application. A custom button, inputs etc.

## Resources

- Firebase
  - Crashlytics
  - Analytics
  - Cloud Messaging (Check the `README.md` [here](https://pub.dev/packages/firebase_messaging/) to **iOS integration**)
- _BLoC_ provider
- Dio Http client