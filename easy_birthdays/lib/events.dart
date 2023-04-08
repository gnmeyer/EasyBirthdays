import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';

class EventsRoute extends StatelessWidget {
  const EventsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Home Page'),
        ),
      ),
    );
  }
}
