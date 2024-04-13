import 'package:flutter/material.dart';
import 'package:app/screens/createevent.dart';
import 'package:app/screens/homepage.dart';
import 'package:app/screens/profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomAppBar(
          color: const Color.fromARGB(255, 202, 178, 172),
          shape: const CircularNotchedRectangle(),
          shadowColor: Colors.black54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: widget.currentIndex == 0 ? Colors.white : Colors.grey,
                onPressed: () {
                  if (widget.currentIndex != 0) {
                    widget.onTap(0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(title: ""),
                      ),
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                color: widget.currentIndex == 1 ? Colors.white : Colors.grey,
                onPressed: () {
                  if (widget.currentIndex != 1) {
                    widget.onTap(1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateEvent()),
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.message),
                color: widget.currentIndex == 2 ? Colors.white : Colors.grey,
                onPressed: () {
                  if (widget.currentIndex != 2) {
                    widget.onTap(2);
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: widget.currentIndex == 3 ? Colors.white : Colors.grey,
                onPressed: () {
                  if (widget.currentIndex != 3) {
                    widget.onTap(3);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyProfilePage(
                          title: '',
                          username: '',
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}