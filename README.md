# flutter_skeleton

A skeleton for a flutter project with some packages included (and AndroidX ready).

## Get started

- Put your `google-services.json` inside of `[app_folder]\android\app`

## Folder structure

- `routes.dart`
  - Where will contains all of routes of your app and where all `screens` will be imported.
- `data`
  - Put here your _BLoC_ files
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
- _BLoC_ provider

## TODO

- Crashlytics iOS configuration