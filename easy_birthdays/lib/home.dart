import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/settings.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsRoute()),
            );
          },
        ),
      ),
    );
  }
}
