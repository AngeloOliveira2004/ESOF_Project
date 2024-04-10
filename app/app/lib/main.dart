import 'package:app/screens/homepage.dart';
import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'final app',
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

