import 'package:flutter/material.dart';
import 'package:easy_birthdays/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  // Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(const MaterialApp(
    title: 'Easy Birthdays',
    home: HomeRoute(),
  ));
}
