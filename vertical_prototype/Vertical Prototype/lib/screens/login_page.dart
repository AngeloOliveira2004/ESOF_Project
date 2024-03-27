import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/screens/Homepage.dart';
import 'package:first_app/screens/signup.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:logger/logger.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  String email = '';
  String password = '';
  final Logger logger = Logger();

  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    // Armazena o contexto
    _context = context;
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login page'),
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
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                bottom: 20.0,
                top: 20.0,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                bottom: 20,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'put you password',
                ),
              ),
            ),
            SizedBox(
              width: 360,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    // Verifica se o usuário está registrado no Realtime Database
                    DatabaseReference userRef =
                        FirebaseDatabase.instance.reference().child('users');
                    userRef
                        .child(userCredential.user!.uid)
                        .onValue
                        .listen((event) {
                      DataSnapshot snapshot = event.snapshot;
                      if (snapshot.value != null) {
                        // Usuário registrado, navegue para a HomePage
                        if (mounted) {
                          bool isUserLoggedIn = true;
                          Navigator.pushReplacement(
                            _context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  HomePage(isLoggedIN: isUserLoggedIn),
                            ),
                          );
                        }
                      } else {
                        // Usuário não registrado, exiba uma mensagem de erro
                        if (mounted) {
                          showDialog(
                            context: _context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Erro de login'),
                                content: const Text(
                                    'Credenciais inválidas ou usuário não registrado.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    });
                  } catch (e) {
                    // Trate os erros de autenticação
                    logger.e('Erro de autenticação: $e');
                    if (mounted) {
                      showDialog(
                        context: _context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Erro de autenticação'),
                            content: const Text(
                                'Ocorreu um erro ao fazer login. Por favor, tente novamente.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.blue, fontSize: 15.0),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: triggerNotification,
        child: const Icon(Icons.add),
      ),
    );
  }
}

