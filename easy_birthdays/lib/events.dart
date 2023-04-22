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
        // StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance.collection('events').snapshots(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     }

        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Text('Loading...');
        //     }
        //     return ListView(
        //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //         Map<String, dynamic> data =
        //             document.data() as Map<String, dynamic>;
        //         return ListTile(
        //           title: Text(data['eventTitle']),
        //           subtitle: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text('Date: ${data['eventDate']}'),
        //               Text('Budget: ${data['eventBudget']}'),
        //               Text('Shop: ${data['eventShop']}'),
        //             ],
        //           ),
        //         );
        //       }).toList(),
        //     );
        //   },
        // ),
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
