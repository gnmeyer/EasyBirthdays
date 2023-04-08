import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/events.dart';
import 'package:easy_birthdays/settings.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Events'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EventsRoute()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Settings'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
