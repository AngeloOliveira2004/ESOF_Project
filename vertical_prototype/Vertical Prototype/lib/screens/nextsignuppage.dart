import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/screens/Homepage.dart';
import 'package:logger/src/logger.dart';

class NextSignupPage extends StatefulWidget {
  final String name;
  final String surname;
  final String email;

  const NextSignupPage({
    super.key,
    required this.name,
    required this.surname,
    required this.email, required void Function() registeredUser, required Logger logger,
  });

  @override
  State<NextSignupPage> createState() => _NextSignupPageState();
}

class _NextSignupPageState extends State<NextSignupPage> {
  bool _isChecked = false;

  void _saveUserData() {
    if (_isChecked) {
      // Salve os dados do usuário no banco de dados
      DatabaseReference userRef = FirebaseDatabase.instance.reference().child('users');
      userRef.child(widget.email).set({
        'name': widget.name,
        'surname': widget.surname,
        'email': widget.email,
      });

      // Após salvar os dados, navegue para a próxima página
      bool isUserLoggedIn = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(isLoggedIN: isUserLoggedIn),
        ),
      );
    } else {
      // Se os termos não forem aceitos, exiba uma mensagem ou tome outra ação
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, aceite os termos para continuar.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Next Sign Up Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'Eu declaro que tenho mais de 18 anos de idade e estou legalmente autorizado a acessar este serviço/aplicativo. Confirmo que compreendo e aceito plenamente os termos de uso e políticas de privacidade desta aplicação.',
                    style: TextStyle(
                      decorationColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _saveUserData,
              child: const Text(
                'Signup',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
