import 'package:first_app/screens/Homepage.dart';
import 'package:flutter/material.dart';

class NextSignupPage extends StatefulWidget {
  const NextSignupPage({Key? key}) : super(key: key);

  @override
  State<NextSignupPage> createState() => NextSignupPageState();
}

class NextSignupPageState extends State<NextSignupPage> {
  bool _isChecked = false;

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
                      _isChecked = value!;
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
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

