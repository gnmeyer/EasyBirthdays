import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

const double eventBudget = -1;
const String eventTitle = 'null';
//Timestamp object from Timestamp class
DateTime eventDate =
    DateTime(2039, 12, 31, 19, 23, 59, 59); // December 31, 2039, 11:59 PM

Map<String, double> eventShop = {
  'null': -1,
};

class EventStorage {
  bool _initialized = false;

  Future<void> initializeDefault() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _initialized = true;
  }

  bool get isInitialized => _initialized;

  Future<void> writeUserInfo(String username) async {
    if (!isInitialized) {
      await initializeDefault();
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('users').doc('cins467').set({
      'Username': username,
    }).then((value) {
      if (kDebugMode) {
        print('user updated successfully');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('writeUserInfo error: $error');
      }
    });
  }
}
