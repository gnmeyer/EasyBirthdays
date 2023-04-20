import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class EventStorage {
  bool _initialized = false;

  Future<void> initializeDefault() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _initialized = true;
  }

  bool get isInitialized => _initialized;

  Future<void> writeEventInfo(double eventBudget, String eventTitle,
      DateTime eventDate, Map eventShop) async {
    if (!isInitialized) {
      await initializeDefault();
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('events').doc('Xxm2R15vAKqAObtsedaV').set({
      'eventBudget': eventBudget,
      'eventTitle': eventTitle,
      'eventDate': eventDate,
      'eventShop': eventShop,
    }).then((value) {
      if (kDebugMode) {
        print('event updated successfully');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('writeEventInfo error: $error');
      }
    });
  }

  Future<void> writeUserInfo(String username) async {
    if (!isInitialized) {
      await initializeDefault();
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('events').doc('qhV6Lq26TdEPuR97yZDt').set({
      'Name': username,
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
