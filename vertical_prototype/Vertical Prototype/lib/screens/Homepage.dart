import 'package:first_app/screens/maps.dart';
import 'package:first_app/screens/Profilepage.dart';
import 'package:first_app/screens/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  final bool isLoggedIN;
  const HomePage({super.key, required this.isLoggedIN});

  @override
  Widget build(BuildContext context) {
    const items = 4;
  

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 60.0), // Espaço entre o BottomAppBar e o LayoutBuilder
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...List.generate(
                    items,
                    (index) => ItemWidget(text: 'Item $index'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  // Adicionar lógica para navegar para a página inicial
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Adicionar lógica para adicionar conteúdo
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Adicionar lógica para exibir notificações
                },
              ),
              CircleAvatar(
                radius: 14, // Tamanho do avatar
                backgroundColor: Colors.transparent, // Tornar o avatar clicável
                child: GestureDetector(
                  onTap: () {
                    if (isLoggedIN) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const profilepage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginDemo()),
                      );
                    }
                  },
                  child: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Center(
              child: Text(text),
            ),
          ),
          const SizedBox(
              height: 8), // Adiciona um espaço entre o texto e a imagem
          const CircleAvatar(
            radius: 20, // Tamanho do avatar
          ),
          const SizedBox(
              height: 8), // Adiciona um espaço entre a imagem e o ícone
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MapsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
