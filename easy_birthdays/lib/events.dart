import 'package:easy_birthdays/edit.dart';
import 'package:easy_birthdays/create.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/settings.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_birthdays/color_provider.dart';

class EventsRoute extends StatelessWidget {
  const EventsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        backgroundColor: Provider.of<ColorProvider>(context)
            .colorSetting, // set the background color of the app bar
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            // Add an Expanded widget here
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('events')
                  .orderBy('EventDate', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case (ConnectionState.waiting):
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Container();
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var doc = snapshot.data!.docs[index];

                          if (Provider.of<PriceProvider>(context)
                                  .priceSetting ==
                              false) {
                            return ListTile(
                                title: Text('Event Name: ${doc["EventName"]}'),
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Event Date: ${doc["EventDate"]}'),
                                    ]));
                          } else {
                            return ListTile(
                              title: Text('Event Name: ${doc["EventName"]}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Event Date: ${doc["EventDate"]}'),
                                  Text('Shop: '),
                                  for (final entry in doc['EventShop'].entries)
                                    Text('${entry.key}: ${entry.value}'),
                                  Text('Event Budget: ${doc["EventBudget"]}'),
                                ],
                              ),
                            );
                          }

                          // return ListTile(
                          //   title: Text('Event Name: ${doc["EventName"]}'),
                          //   subtitle: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text('Event Date: ${doc["EventDate"]}'),
                          //       Text('Shop: '),
                          //       for (final entry in doc['EventShop'].entries)
                          //         Text('${entry.key}: ${entry.value}'),
                          //       Text('Event Budget: ${doc["EventBudget"]}'),
                          //     ],
                          //   ),
                          // );
                        },
                      );
                    }
                }
              },
            ),
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Provider.of<ColorProvider>(context).colorSetting),
            ),
          ),
        ],
      )),
    );
  }
}
