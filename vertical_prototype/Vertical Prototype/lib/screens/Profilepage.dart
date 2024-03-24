import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => ProfilePage();
}

class ProfilePage extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
          ),
        ],
      ),
    );
  }
}
