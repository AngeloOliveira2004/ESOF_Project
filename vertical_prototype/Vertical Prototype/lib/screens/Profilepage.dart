import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => ProfilePage();
}

class ProfilePage extends State<profilepage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    // Obtém o usuário atualmente autenticado
    _user = FirebaseAuth.instance.currentUser;
  }
  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      _user = null;
    });
    // Navegar para a página de login após fazer logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginDemo()),
    );
  }

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
   body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: ${_user?.email ?? 'Não autenticado'}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signOut(context), // Passa o contexto para _signOut
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}