import 'package:easy_birthdays/edit.dart';
import 'package:easy_birthdays/create.dart';
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            // Navigate to edit page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditRoute()),
            );
          },
          child: const Text('Edit'),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to edit page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateRoute()),
            );
          },
          child: const Text('Create'),
        ),
      ])),
    );
  }
}
