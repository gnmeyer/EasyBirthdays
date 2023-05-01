import 'package:easy_birthdays/edit.dart';
import 'package:easy_birthdays/create.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/settings.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'package:easy_birthdays/color_provider.dart';

class EventsRoute extends StatelessWidget {
  const EventsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _eventStorage = FirebaseFirestore.instance;

    //Text field
    final _eventBudgetController = TextEditingController();
    final _eventTitleController = TextEditingController();
    final _eventDateController = TextEditingController();
    final _eventShopController = TextEditingController();

    late String event_id;
    late String event_date;
    late String event_budget;

    void submitForm() async {
      event_id = _eventTitleController.text;
      event_date = _eventDateController.text;
      event_budget = _eventBudgetController.text;

      Map<String, String> eventShop = _eventShopController.text
          .split(',')
          .asMap()
          .map((index, value) => MapEntry('Item ${index + 1}', value.trim()))
          .cast<String, String>();

      if (_formKey.currentState!.validate()) {
        final eventData = {
          'EventName': event_id,
          'EventDate': event_date,
          'EventShop': eventShop,
          'EventBudget': event_budget,
        };
        await _eventStorage.collection('events').doc(event_id).set(eventData);
      }
      // Reset the form
      _formKey.currentState!.reset();
    }

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
                                title: Text('${doc["EventName"]}'),
                                subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${doc["EventDate"]}'),
                                    ]));
                          } else {
                            return Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                title: Text('${doc["EventName"]}'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${doc["EventDate"]}'),
                                    // Text('Shop: '),
                                    for (final entry
                                        in doc['EventShop'].entries)
                                      Text('${entry.key} - ${entry.value}'),
                                    Text(
                                        'Total Budget: \$${doc["EventBudget"]}'),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Confirm Delete'),
                                              content: Text(
                                                  'Are you sure you want to delete this event?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('No'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('Yes'),
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection('events')
                                                        .doc(
                                                            '${doc["EventName"]}')
                                                        .delete();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(12),
                                        primary: Colors.red,
                                      ),
                                      child: Icon(Icons.delete),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Edit Event'),
                                              actions: <Widget>[
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    children: <Widget>[
                                                      // Add TextFormFields and ElevatedButton here.
                                                      TextFormField(
                                                        controller:
                                                            _eventTitleController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Provider.of<
                                                                          ColorProvider>(
                                                                      context)
                                                                  .colorSetting,
                                                            ),
                                                          ),
                                                          hintText:
                                                              '${doc["EventName"]}',
                                                        ),
                                                        // The validator receives the text that the user has entered.
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter an event name';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _eventDateController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Provider.of<
                                                                          ColorProvider>(
                                                                      context)
                                                                  .colorSetting,
                                                            ),
                                                          ),
                                                          hintText:
                                                              '${doc["EventDate"]}',
                                                        ),
                                                        // The validator receives the text that the user has entered.
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter a date';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _eventShopController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Provider.of<
                                                                          ColorProvider>(
                                                                      context)
                                                                  .colorSetting,
                                                            ),
                                                          ),
                                                          hintText:
                                                              'Enter an item name',
                                                        ),
                                                        // The validator receives the text that the user has entered.
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter an item name';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _eventBudgetController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Provider.of<
                                                                          ColorProvider>(
                                                                      context)
                                                                  .colorSetting, // set border color here
                                                            ),
                                                          ),
                                                          hintText:
                                                              '${doc["EventBudget"]}',
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter a number';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TextButton(
                                                            child:
                                                                Text('Cancel'),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child:
                                                                Text('Submit'),
                                                            onPressed: () {
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'events')
                                                                  .doc(
                                                                      '${doc["EventName"]}')
                                                                  .delete();
                                                              submitForm();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                            // do something
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(12),
                                        primary: Colors.blue,
                                      ),
                                      child: Icon(Icons.edit),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Create Event'),
                    actions: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // Add TextFormFields and ElevatedButton here.
                            TextFormField(
                              controller: _eventTitleController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Provider.of<ColorProvider>(context)
                                        .colorSetting,
                                  ),
                                ),
                                hintText: 'Enter an event name',
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an event name';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _eventDateController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Provider.of<ColorProvider>(context)
                                        .colorSetting,
                                  ),
                                ),
                                // hintText: 'Enter an event date',
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a date';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _eventShopController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Provider.of<ColorProvider>(context)
                                        .colorSetting,
                                  ),
                                ),
                                // hintText: 'Enter an item name',
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter an item name';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _eventBudgetController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Provider.of<ColorProvider>(context)
                                        .colorSetting, // set border color here
                                  ),
                                ),
                                // hintText: 'Enter event budget',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a number';
                                }
                                return null;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Submit'),
                                  onPressed: () {
                                    submitForm();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                  // do something
                },
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(12),
              primary: Colors.blue,
            ),
            child: const Icon(Icons.add),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate to edit page
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => CreateRoute()),
          //     );
          //   },
          //   child: const Text('Create'),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all<Color>(
          //         Provider.of<ColorProvider>(context).colorSetting),
          //   ),
          // ),
        ],
      )),
    );
  }
}
