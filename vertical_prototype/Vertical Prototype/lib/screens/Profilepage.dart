import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      //child: const Image(image: AssetImage()),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.cyan,
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Text('${_user?.email?? 'Não autenticado'}', style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 20),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    _signOut(context), // Passa o contexto para _signOut
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
