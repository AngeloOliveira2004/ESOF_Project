import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: const Color(0xFF9D50DD),
        )
      ],
      debug: true);
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAKSZ98JQXSDah6DdgMfKda10wlzm9yAEA",
      projectId: "first-a67d7",
      messagingSenderId: "13419220168",
      appId: "1:13419220168:android:f5eef4777d990e0a3e29fd",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login page',
      home: LoginDemo(),
    );
  }
}
