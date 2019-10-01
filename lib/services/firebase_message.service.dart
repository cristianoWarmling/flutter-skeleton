import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessageService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void init() {
    // Needs be in a delayed for avoid errors when initialized before
    // everything else
    Future.delayed(Duration(milliseconds: 500), () async {
      _firebaseMessaging.requestNotificationPermissions();

      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
        },
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
        },
        onBackgroundMessage: _backgroundMessageHandler,
      );

      // You can use the token bellow to send test messages on
      // firebase cloud messaging
      var myToken = await _firebaseMessaging.getToken();
      print("Firebase Token: $myToken");
    });
  }

  static Future<dynamic> _backgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      // final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      // final dynamic notification = message['notification'];
    }

    // Or do other work.

    return Future<void>.value();
  }
}
