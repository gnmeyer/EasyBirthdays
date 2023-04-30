import 'package:flutter/material.dart';
import 'package:easy_birthdays/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'color_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure that the widget binding is initialized before calling Firebase.initializeApp.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ColorProvider()),
        ChangeNotifierProvider(create: (context) => PriceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Birthdays',
      home: const HomeRoute(),
    );
  }
}
