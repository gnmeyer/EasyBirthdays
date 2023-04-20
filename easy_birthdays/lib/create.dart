import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class CreateRoute extends StatelessWidget {
  const CreateRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MyCustomForm(),
      ])),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final EventStorage _storage = EventStorage();
  late Future<String> _username;
  final _usernameController = TextEditingController();

  Future<void> _setName() async {
    final String username = _usernameController.text;
    await _storage.writeUserInfo(username);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                  hintText: 'username'),
            ),
            ElevatedButton(
                onPressed: () {
                  _setName();
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
