import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/routes.dart';

void main() {
  // To enable in dev mode, uncomment the line bellow.
  // It is intended only to test if your crashlytics is working and
  // not for regular development.
  // Crashlytics.instance.enableInDevMode = true;

  FirebaseAnalytics analytics = FirebaseAnalytics();
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned<Future<void>>(() async {
    runApp(
      MaterialApp(
        title: 'Flutter Skeleton',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: RoutesProvider.routes,
        initialRoute: "/",
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }, onError: Crashlytics.instance.recordError);
}
