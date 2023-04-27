import 'package:easy_birthdays/edit.dart';
import 'package:easy_birthdays/create.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('events').snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case (ConnectionState.waiting):
                return const CircularProgressIndicator();

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Container();
                } else if (snapshot.data!.docs.length < 2) {
                  return Text('Not enough data');
                } else {
                  return Text(
                      'Event Name: ${snapshot.data!.docs[1]["EventName"]}\nEvent Date: ${snapshot.data!.docs[1]["EventDate"]}');
                }
            }
          },
        ),
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
              MaterialPageRoute(builder: (context) => CreateRoute()),
            );
          },
          child: const Text('Create'),
        ),
      ])),
    );
  }
}
