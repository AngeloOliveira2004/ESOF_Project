import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "sua-api-key",
      authDomain: "seu-auth-domain",
      projectId: "seu-project-id",
      storageBucket: "seu-storage-bucket",
      messagingSenderId: "seu-messaging-sender-id",
      appId: "seu-app-id",
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
