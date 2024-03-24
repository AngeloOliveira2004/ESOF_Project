import 'package:first_app/screens/loginPage.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

void main() {
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





