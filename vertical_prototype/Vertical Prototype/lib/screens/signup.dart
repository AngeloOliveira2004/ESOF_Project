import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/loginPage.dart';
import 'package:first_app/screens/nextsignuppage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    void _registeredUser() async{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, 
          password: password,
        );
        print('Usuário criado com sucesso: ${userCredential.user!.email}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginDemo()),
        );
      } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          print('A senha é muito fraca.');
        } else if (e.code == 'email-already-in-use') {
          print('O email já está em uso.');
        }
      }
      print('Erro ao criar usuário: $e');
    }
  }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign up page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 60.0,
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginDemo()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUp()),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 20.0, top: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Surname',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(
              width: 360,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NextSignupPage(registeredUser: _registeredUser)),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.blue, fontSize: 15.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
