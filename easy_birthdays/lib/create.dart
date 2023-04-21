import 'dart:html';

import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({Key? key}) : super(key: key);

  @override
  _CreateRouteState createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  final _formKey = GlobalKey<FormState>();
  final _eventStorage = FirebaseFirestore.instance;

  //Text field
  final _eventBudgetController = TextEditingController();
  final _eventTitleController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _eventShopController = TextEditingController();

  late String name;
  late String pass;

  void submitForm() async {
    name = _eventTitleController.text;
    pass = _eventDateController.text;
    String eventTitle = _eventTitleController.text;
    double eventBudget = double.tryParse(_eventBudgetController.text) ?? 0;
    DateTime eventDate = DateTime.parse(_eventDateController.text);
    Map<String, double> eventShop = _eventShopController.text
        .split(',')
        .asMap()
        .map((index, value) =>
            MapEntry('Item ${index + 1}', double.parse(value)));

    if (_formKey.currentState!.validate()) {
      final eventData = {
        'name': name,
        'pass': pass,
      };
      await _eventStorage.collection('events').add(eventData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('create event')),
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
              TextFormField(
                controller: _eventTitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                  border: OutlineInputBorder(),
                  hintText: 'Enter an event date',
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
                  border: OutlineInputBorder(),
                  hintText: 'Enter an item name',
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
                  border: OutlineInputBorder(),
                  hintText: 'Enter event budget',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Creating Event')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        )));
  }
}
