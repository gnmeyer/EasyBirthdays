import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/storage.dart';

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
  final _formKey = GlobalKey<FormState>();

  //Text field
  final _eventBudgetController = TextEditingController();
  final _eventTitleController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _eventShopController = TextEditingController();

  final EventStorage _eventStorage = EventStorage();

  Future<void> _submitForm() async {
    final formData = _formKey.currentState;

    if (formData != null) {
      if (formData.validate()) {
        // Get the current text values of the form fields
        final String eventTitle = _eventTitleController.text;
        final DateTime eventDate = DateTime.parse(_eventDateController.text);
        final Map<String, double> eventShop = _eventShopController.text
            .split(',')
            .asMap()
            .map((index, value) =>
                MapEntry('Item ${index + 1}', double.parse(value)));
        final double eventBudget =
            double.tryParse(_eventBudgetController.text) ?? 0;

        // Write the form data to Firestore using the EventStorage class
        await _eventStorage.writeEventInfo(
          eventBudget,
          eventTitle,
          eventDate,
          eventShop,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
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
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
