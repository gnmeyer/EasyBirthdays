import 'package:easy_birthdays/camera.dart';
import 'package:flutter/material.dart';
import 'package:easy_birthdays/main.dart';
import 'package:easy_birthdays/events.dart';
import 'package:easy_birthdays/settings.dart';
import 'package:provider/provider.dart';
import 'package:easy_birthdays/color_provider.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Birthdays'),
        backgroundColor: Provider.of<ColorProvider>(context)
            .colorSetting, // set the background color of the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Events'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EventsRoute()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Provider.of<ColorProvider>(context).colorSetting),
              ),
            ),
            ElevatedButton(
              child: const Text('Settings'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsRoute()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Provider.of<ColorProvider>(context).colorSetting),
              ),
            ),
            ElevatedButton(
              child: const Text('Camera'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraRoute()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Provider.of<ColorProvider>(context).colorSetting),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
