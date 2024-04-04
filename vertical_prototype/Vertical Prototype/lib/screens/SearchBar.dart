import 'package:flutter/material.dart';

class _SearchBar extends StatelessWidget {
  final IconData icon;

  const _SearchBar({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 8,
            height: 8,
          ),
          const Expanded(
              child: TextField(
            decoration: InputDecoration(
              label: Text('Search'),
              border: OutlineInputBorder(),
            ),
          )),
        ],
      ),
    );
  }
}
