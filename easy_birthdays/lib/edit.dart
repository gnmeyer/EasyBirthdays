import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';

class EditRoute extends StatelessWidget {
  const EditRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Events'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: const Text('Events Page'),
        ),
      ])),
    );
  }
}
